import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quran_app_revision/core/common/services/injection_container.dart';
import 'package:quran_app_revision/feature/ayah/presentation/controller/ayah_controller.dart';
import 'package:quran_app_revision/feature/ayah/presentation/screens/ayah_by_surah_screen.dart';
import 'package:quran_app_revision/feature/surah/presentations/controllers/all_surah_controller.dart';
import 'package:quran_app_revision/feature/surah/presentations/screens/surah_screen.dart';

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
          create: (context) => getIt<AllSurahController>()..getAllSurah(),
        ),
        ChangeNotifierProvider(
          create: (context) => getIt<AyahController>()
            ..getAyah(surahNumber: 1)
            ..getAllAyah(surahNumber: 1),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: AyahScreen(),
        ),
      ),
    );
  }
}
