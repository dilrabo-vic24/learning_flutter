import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio_library_lesson/main.dart';
import 'package:dio_library_lesson/services/injection/injection_service.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioClient {
  late Dio _dio;

  DioClient() {
    _dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        sendTimeout: const Duration(seconds: 10),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
      ),
    );

    _dio.interceptors.addAll(
      [
        InterceptorsWrapper(
          onRequest: (options, handler) async {
            if (options.extra["requiresToken"] == true) {
              final token = getIt<SharedPreferences>().getString("token");

              if (token != null) {
                options.headers["Authorization"] = "Bearer $token";
              }
            }
            if (kDebugMode) {
              // log("Headers: ${options.headers}");
              // log("Data: ${options.data}");
            }

            return handler.next(options);
          },
          onResponse: (response, handler) {
            return handler.next(response);
          },
          onError: (DioException error, ErrorInterceptorHandler handler) {
            log(error.message.toString());

            if (error.type == DioExceptionType.connectionTimeout ||
                error.type == DioExceptionType.receiveTimeout) {
              throw Exception(
                  "The connection has timed out, please try again later");
            }

            if (error.response?.statusCode == 401) {
              log(error.response!.statusCode.toString());

              navigatorKey.currentState!.pushNamed('/login');
            }

            return handler.next(error);
          },
        ),
        RetryInterceptor(
          dio: _dio,
          retries: 3,
          retryDelays: [
            const Duration(seconds: 1),
            const Duration(seconds: 2),
            const Duration(seconds: 3)
          ],
        ),
        if (kDebugMode)
          LogInterceptor(
            responseBody: true,
            requestBody: true,
          ),
      ],
    );
  }

  Dio get dio => _dio;
}

class RetryInterceptor extends Interceptor {
  final Dio dio;
  final int retries;
  final List<Duration> retryDelays;

  RetryInterceptor({
    required this.dio,
    this.retries = 3,
    this.retryDelays = const [
      Duration(seconds: 1),
      Duration(seconds: 2),
      Duration(seconds: 3)
    ],
  });

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    if (_shouldRetry(err) && retries > 0) {
      final retryAttempt = retries - retryDelays.length + 1;
      if (retryAttempt < retryDelays.length) {
        await Future.delayed(retryDelays[retryAttempt]);
      }

      try {
        final response = await dio.request(
          err.requestOptions.path,
          options: Options(
            method: err.requestOptions.method,
            headers: err.requestOptions.headers,
            extra: err.requestOptions.extra,
          ),
        );
        return handler.resolve(response);
      } catch (e) {
        return handler.next(err);
      }
    }

    return super.onError(err, handler);
  }

  bool _shouldRetry(DioException err) {
    return err.type != DioExceptionType.cancel &&
        err.type != DioExceptionType.badResponse;
  }
}
