import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:home_heaven/core/common/app/service_injection/injection_container.dart';
import 'package:home_heaven/feature/auth/domain/usecases/login_usecase.dart';
import 'package:home_heaven/feature/auth/domain/usecases/register_usecase.dart';

class AuthController extends ChangeNotifier {
  final LoginUsecase loginUsecase = getIt<LoginUsecase>();
  final RegisterUsecase registerUsecase = getIt<RegisterUsecase>();
  AuthController();

  bool isLoading = false;
  bool isVisible = false;
  String message = "";

  void toggleVisibility() {
    isVisible = !isVisible;
    notifyListeners();
  }

//login controller
  Future<void> loginWithPhone({
    required String phoneNumber,
    required String password,
  }) async {
    isLoading = true;
    notifyListeners();
    log("data in usecase: $phoneNumber, $password");
    final result = await loginUsecase.call(
      phoneNumber: phoneNumber,
      password: password,
    );
    isLoading = false;
    result.fold(
      (error) => message = error,
      (_) => message = "Login successfully",
    );
    notifyListeners();
  }

  //register controller
  Future<void> register(
      {required String phoneNumber,
      required String email,
      required String password}) async {
    isLoading = true;
    notifyListeners();

    log("Data in register controller");
    final result = await registerUsecase.call(
        phoneNumber: phoneNumber, email: email, password: password);
    log(result.toString());

    isLoading = false;
    notifyListeners();
    return result.fold(
      (l) => message = l,
      (r) => message = "Register successfully",
    );
  }
}
