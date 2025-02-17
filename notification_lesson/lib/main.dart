import 'package:flutter/material.dart';
import 'package:notification_lesson/home_screen.dart';
import 'package:notification_lesson/notification_sercice.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tzd;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationSercice().initNotification();
  tzd.initializeTimeZones();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    NotificationSercice.navigatorKey = navigatorKey;
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
