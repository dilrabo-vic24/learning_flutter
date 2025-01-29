import 'package:exam_month_3/data/remote_datasource/auth_repo.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  final AuthRepo authRepo;

  bool isVisible = false;
  bool isLoading = false;

  AuthProvider({required this.authRepo});

  void toggleVisibility() {
    isVisible = !isVisible;
    notifyListeners();
  }

  Future<bool> login({required String email, required String password}) async {
    isLoading = true;
    notifyListeners();

    final response = await authRepo.login(email: email, password: password);
    // log("nimadir");
    isLoading = false;
    notifyListeners();
    return response;
  }

  Future<void> register(
      {required String email, required String password}) async {
    isLoading = true;
    notifyListeners();

    authRepo.register(email: email, password: password);

    isLoading = false;
    notifyListeners();
  }
}
