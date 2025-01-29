import 'package:exam_month_3/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class PasswordTextFormField extends StatelessWidget {
  final TextEditingController passwordController;
  const PasswordTextFormField({super.key, required this.passwordController});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) {
        return TextFormField(
          obscureText: authProvider.isVisible,
          controller: passwordController,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.r),
                ),
              ),
              prefixIcon: const Icon(Icons.lock_outline),
              hintText: "Password",
              suffixIcon: IconButton(
                  onPressed: () {
                    authProvider.toggleVisibility();
                  },
                  icon: Icon(authProvider.isVisible
                      ? Icons.visibility
                      : Icons.visibility_off))),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Password can not be empty";
            }
            return null;
          },
        );
      },
    );
  }
}
