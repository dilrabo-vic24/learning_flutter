import 'package:agranom_ai/bloc/auth_bloc/auth_bloc.dart';
import 'package:agranom_ai/bloc/image_upload_bloc/image_upload_bloc.dart';
import 'package:agranom_ai/common/app/injcetion_container.dart';
import 'package:agranom_ai/data/repositories/auth_repository.dart';
import 'package:agranom_ai/data/repositories/home_repo.dart';
import 'package:agranom_ai/presentation/screens/auth/sign_in_screen.dart';
import 'package:agranom_ai/presentation/screens/auth/sign_up_screen.dart';
import 'package:agranom_ai/presentation/screens/home/image_scrren.dart';
import 'package:agranom_ai/presentation/screens/home/landing_screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(
            getIt<AuthRepository>(),
            getIt<SharedPreferences>(),
          )..add(const AuthEvent.checkAuth()),
        ),
        BlocProvider<ImageUploadBloc>(
          create: (context) => ImageUploadBloc(getIt<HomeRepo>()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        initialRoute: '/signin',
        routes: {
          '/signin': (context) => const SignInScreen(),
          '/signup': (context) => const SignUpScreen(),
          '/landing': (context) => const LandingPage(),
          '/camera': (context) => const CameraScreen(),
        },
      ),
    );
  }
}
