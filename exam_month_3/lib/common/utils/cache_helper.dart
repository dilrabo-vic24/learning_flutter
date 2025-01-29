import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  final SharedPreferences preferences;

  CacheHelper({required this.preferences});

  final String _tokenKey = "token";

  Future<bool> setToken(String token)async{
    try {
      final result = await preferences.setString(_tokenKey, token);
      if (result) {
        log("token saved");
        return true;
      }
    } catch (e) {
      throw Exception("Error while saving token");
    }
    return false;
  }

  String? getToken(){
    return preferences.getString(_tokenKey);
  }
}