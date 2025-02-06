import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_heaven/core/common/app/service_injection/injection_container.dart';
import 'package:home_heaven/core/utils/constants/prefs_keys.dart';
import 'package:home_heaven/feature/auth/presentation/controllers/auth_controller.dart';
import 'package:home_heaven/feature/auth/presentation/screens/login_screen.dart';
import 'package:home_heaven/feature/home/presentation/controllers/home_controller.dart';
import 'package:home_heaven/feature/home/presentation/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthController(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        )
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home:
                getIt<SharedPreferences>().getString(PrefsKeys.tokenKey) != null
                    ? HomeScreen()
                    : LoginScreen()),
      ),
    );
  }
}
