import 'dart:developer';

import 'package:auth_firebase/commons/utils/server_exception.dart';
import 'package:auth_firebase/data/auth_service.dart';
import 'package:flutter/foundation.dart';

class AuthentificationProvider extends ChangeNotifier {
  final AuthenticationService authService;

  AuthentificationProvider({required this.authService});

  bool isLoading = false;
  bool isLogin = false;
  String message = "";

  //set login or register
  void setIsLogin() async {
    notifyListeners();
    isLogin = !isLogin;
    log(isLoading.toString());
    notifyListeners();
  }

//calling login in provider
  Future<void> login({required String email, required String password}) async {
    isLoading = true;
    notifyListeners();

    try {
      final result = await authService.login(email: email, password: password);
      if (result) {
        message = "Logged successfully";
      } else {
        message = "Error while registering";
      }
    } on ServerException catch (e) {
      message = e.message.toString();
    }

    isLoading = false;
    notifyListeners();
  }

//calling register in provider
  Future<void> register(
      {required String email, required String password}) async {
    isLoading = true;
    notifyListeners();

    try {
      final result =
          await authService.register(email: email, password: password);
      if (result) {
        message = "Registered successfully";
      } else {
        message = "Error while registering";
      }
    } on ServerException catch (e) {
      message = e.message.toString();
    }

    isLoading = false;
    notifyListeners();
  }
}
