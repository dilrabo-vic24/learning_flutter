import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:home_heaven/core/common/app/service_injection/injection_container.dart';
import 'package:home_heaven/core/common/exceptions/custom_exception.dart';
import 'package:home_heaven/core/utils/constants/network_constants.dart';
import 'package:home_heaven/core/utils/constants/prefs_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

//authRemoteDataSource abstract classini yaratish
abstract class AuthRemoteDataSource {
  //login abstract metodini yaratish
  Future<bool?> login({
    required String phoneNumber,
    required String password,
  });

  //register abstract metodini yaratish
}

//authRemoteDataSourceImp implimintatsiyasini yozish
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  Dio dio = getIt<Dio>();

  AuthRemoteDataSourceImpl();

  //login funksiyani implimintatsiyasini yozish
  @override
  Future<bool?> login(
      {required String phoneNumber, required String password}) async {
    final url = "${NetworkConstants.authUrl}/signin";
    log("data in data source: $phoneNumber $password");

    final data = {
      "phone_number": phoneNumber,
      "email": "",
      "auth_method": "phone-number",
      "password": password,
    };

    try {
      final response =
          await dio.post(url, data: jsonEncode(data), options: Options());

      // log(response.data);
      // log("nimadir");
      if (response.statusCode == 200) {
        log(response.statusCode.toString());
        final prefs = await getIt<SharedPreferences>().setString(
            PrefsKeys.tokenKey, response.data["data"]["access_token"]);
        log(response.data["data"]["access_token"]);
        return true;
      }
      ;
      return false;
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        log("User with same credentals already exists");
        throw ServerException(
            errorMessage: "Incorrect credentals are provided", statusCode: 400);
      }
      log("Error happened while logged in");
    } catch (e) {
      throw ServerException(
          errorMessage: "Please try again later", statusCode: 500);
    }
  }

  //register funksiyasi implimintatsiyasini yozish
}