import 'package:flutter/material.dart';
import 'package:home_heaven/core/utils/app_colors.dart';
import 'package:home_heaven/feature/auth/presentation/controllers/auth_controller.dart';

class PasswordTextField extends StatelessWidget {
  final TextEditingController passwordController;
  final AuthController authController;
  const PasswordTextField({
    super.key,
    required this.passwordController,
    required this.authController,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: passwordController,
      obscureText: authController.isVisible,
      decoration: InputDecoration(
        fillColor: AppColors.whiteColor,
        filled: true,
        prefixIcon: const Icon(Icons.lock),
        labelText: 'Password',
        border: const OutlineInputBorder(),
        hintText: 'Enter your password',
        suffixIcon: IconButton(
          icon: Icon(
            authController.isVisible ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            authController.toggleVisibility();
          },
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a password';
        } else if (value.length < 8) {
          return 'Password must be at least 8 characters';
        }
        return null;
      },
    );
  }
}
