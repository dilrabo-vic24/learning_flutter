import 'package:exam_month_3/common/service/injection_container.dart';
import 'package:exam_month_3/data/remote_datasource/auth_repo.dart';
import 'package:exam_month_3/data/remote_datasource/product_repo.dart';
import 'package:exam_month_3/presentations/screens/splash_screen.dart';
import 'package:exam_month_3/providers/auth_provider.dart';
import 'package:exam_month_3/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding();
  await init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(authRepo: AuthRepo()),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider(productRepo: ProductRepo()),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
