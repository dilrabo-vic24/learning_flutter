
import 'package:crud_api_lesson/data/datasource/remote_datasource/product_service.dart';
import 'package:crud_api_lesson/presentation/screens/home_screen.dart';
import 'package:crud_api_lesson/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          ProductProvider(productService: ProductService())..getAllProducts(),
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          // home: getIt<CasheHelper>().getToken() != null
          //     ? const HomeScreen()
          //     : const LoginScreen(),
          // home: const RegisterScreen(),
          home:  HomeScreen(),
        ),
      ),
    );
  }
}
