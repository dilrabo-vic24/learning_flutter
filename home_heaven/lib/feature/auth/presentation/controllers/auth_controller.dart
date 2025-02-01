import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:home_heaven/core/common/app/service_injection/injection_container.dart';
import 'package:home_heaven/feature/auth/domain/usecases/login_usecase.dart';

class AuthController extends ChangeNotifier {
  final LoginUsecase loginUsecase = getIt<LoginUsecase>();

  AuthController();

  bool isLoading = false;
  String message = "";
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
}
