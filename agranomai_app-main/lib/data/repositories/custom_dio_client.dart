import 'dart:async';
import 'dart:developer';
import 'package:agranom_ai/common/app/injcetion_container.dart';
import 'package:dio/dio.dart';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioClient {
  late Dio _dio;

  DioClient() {
    _dio = Dio(BaseOptions(
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 10),
      sendTimeout: const Duration(seconds: 10),
     
    ));

    _dio.interceptors.addAll([
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          if (options.extra["requiresToken"] == true) {
            final token = getIt<SharedPreferences>().getString("token");
            if (token != null) {
              options.headers["Authorization"] =
                  "Bearer $token"; 
            }
          }

          if (kDebugMode) {
            log("Headers: ${options.headers}");
            log("Data: ${options.data}");
          }

          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioException e, ErrorInterceptorHandler handler) async {
          log(e.message.toString());

          if (e.type == DioExceptionType.connectionTimeout ||
              e.type == DioExceptionType.receiveTimeout) {
            throw TimeoutException(
                "The connection has timed out, please try again.");
          }

          if (e.response?.statusCode == 401) {
            log(e.response!.statusCode.toString());
       
          }

          return handler.next(e);
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
    ]);
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
        err.type !=
            DioExceptionType
                .badResponse;
  }
}