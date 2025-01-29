// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:books_app_localization/data/remote_db/books_repo.dart';
import 'package:books_app_localization/presentation/screens/books_screen.dart';
import 'package:books_app_localization/presentation/screens/onboarding_screen.dart';
import 'package:books_app_localization/presentation/screens/splash_screen.dart';
import 'package:books_app_localization/providers/books_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => BooksProvider(booksRepo: BooksRepo())..getAllBooks(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: OnboardingScreen(),
      ),
    );
  }
}


//api:   https://www.postman.com/postman/postman-library-api-v2/request/wnwrous/get-books
//figma:    https://www.figma.com/design/Fy81dFsIHmfNT58syNpSji/Book-App-UI-KIT-(Community)?node-id=1-832&t=GcwESOBzqDCMqzp0-1