import 'package:dio/dio.dart';

abstract class AuthRepository {
  Future<String> signIn({
    required String phoneNumber,
    required String password,
  });

  Future<String> signUp({
    required String phoneNumber,
    required String password,
  });
}

class AuthRepositoryImpl implements AuthRepository {
  final Dio _dio;
  static const baseUrl = 'https://api.agronomai.birnima.uz/api/auth';

  AuthRepositoryImpl(this._dio);

  @override
  Future<String> signIn({
    required String phoneNumber,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        '$baseUrl/signin',
        data: {
          'phone_number': phoneNumber,
          'auth_method': 'phone-number',
          'password': password,
        },
      );

      if (response.statusCode == 201) {
        return response.data['data']['access_token'];
      }
      throw Exception('Failed to sign in');
    } catch (e) {
      throw Exception('Failed to sign in: $e');
    }
  }

  @override
  Future<String> signUp({
    required String phoneNumber,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        '$baseUrl/signup',
        data: {
          'phone_number': phoneNumber,
          'auth_method': 'phone-number',
          'password': password,
        },
      );

      if (response.statusCode == 201) {
        return response.data['data']['access_token'];
      }
      throw Exception('Failed to sign up');
    } catch (e) {
      throw Exception('Failed to sign up: $e');
    }
  }
}
