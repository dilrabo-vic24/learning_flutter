import 'dart:convert';
import 'dart:developer';

import 'package:exam_month_3/common/network_constants.dart';
import 'package:exam_month_3/common/service/injection_container.dart';
import 'package:exam_month_3/common/utils/cache_helper.dart';
import 'package:http/http.dart' as http;

class AuthRepo {
  final CacheHelper cacheHelper = getIt<CacheHelper>();
  Future<bool> login({required String email, required String password}) async {
    final url = Uri.parse("${NetworkConstants.loginUrl}");
    final data = {
      "phone_number": "+998123455678",
      "email": email,
      "auth_method": "email",
      "password": password,
    };

    try {
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(data),
      );
      log("login ${response.body}");

      if (response.statusCode == 201) {
        log("status code 201: Login successfull");
        final responseBody = jsonDecode(response.body);
        getIt<CacheHelper>().setToken(responseBody['data']['acces_token']);
        return true;
      } else {
        log("You did not have account");
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<void> register(
      {required String email, required String password}) async {
    final url = Uri.parse("${NetworkConstants.registerUrl}");
    final data = {
      "phone_number": "+998123455678",
      "email": email,
      "auth_method": "email",
      "password": password,
    };

    try {
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(data),
      );
      log("register ${response.body}");

      if (response.statusCode == 201) {
        log("status code 201: Login successfull");
        final responseBody = jsonDecode(response.body);
        getIt<CacheHelper>().setToken(responseBody['data']['acces_token']);
        log("token2 ${getIt<CacheHelper>().getToken()}");
      }
    } catch (e) {
      throw Exception("error: $e");
    }
  }
}
