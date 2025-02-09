import 'package:auth_firebase/presentations/widgets/custom_text_style.dart';
import 'package:auth_firebase/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatefulWidget {
  AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthentificationProvider>(
      builder: (context, authentificationProvider, child) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              spacing: 20,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  decoration: InputDecoration(
                      labelText: "Email", border: OutlineInputBorder()),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: passwordController,
                  decoration: InputDecoration(
                      labelText: "Password", border: OutlineInputBorder()),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(300, 40), backgroundColor: Colors.cyan),
                  onPressed: () async {
                    if ((emailController.text.trim().isNotEmpty &&
                            emailController.text.trim() != null) &&
                        (passwordController.text.trim().isNotEmpty &&
                            passwordController.text.trim() != null)) {
                      if (emailController.text.trim().contains("@gmail.com")) {
                        final result = authentificationProvider.isLogin
                            ? authentificationProvider.login(
                                email: emailController.text.trim(),
                                password: passwordController.text.trim())
                            : authentificationProvider.register(
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                              );

                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: CustomTextStyle(
                              text: authentificationProvider.message,
                              fontSize: 20),
                          backgroundColor: authentificationProvider.message
                                  .contains("success")
                              ? Colors.green
                              : Colors.red,
                        ));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: CustomTextStyle(
                              text: "Email format is incorrect", fontSize: 20),
                          backgroundColor: Colors.red,
                        ));
                      }
                      if (passwordController.text.trim().length < 6) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: CustomTextStyle(
                              text: "Password should be at least 6 characters",
                              fontSize: 20),
                          backgroundColor: Colors.red,
                        ));
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: CustomTextStyle(
                            text: "These fiels can not be empty", fontSize: 20),
                        backgroundColor: Colors.red,
                      ));
                    }
                    // log("login and register ${result.toString()}");
                  },
                  child: CustomTextStyle(
                      text: authentificationProvider.isLogin
                          ? "Login"
                          : "Register",
                      fontSize: 25),
                ),
                TextButton(
                  onPressed: () async {
                    authentificationProvider.setIsLogin();
                  },
                  child: CustomTextStyle(
                      text: authentificationProvider.isLogin
                          ? "Don't you have an account? Register"
                          : "Already have an account? Login",
                      fontSize: 20),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
