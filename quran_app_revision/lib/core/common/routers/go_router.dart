import 'package:go_router/go_router.dart';
import 'package:quran_app_revision/feature/ayah/presentation/screens/ayah_by_surah_screen.dart';
import 'package:quran_app_revision/feature/surah/presentations/screens/another.dart';
import 'package:quran_app_revision/feature/surah/presentations/screens/surah_screen.dart';

final appRouter = GoRouter(initialLocation: "/", routes: [
  GoRoute(
    path: "/",
    builder: (context, state) => SurahScreen(),
  ),
  // GoRoute(
  //   path: SurahScreen.path,
  //   builder: (context, state) => const SurahScreen(),
  // ),
  GoRoute(
    path: AyahScreen.path,
    builder: (context, state) {
      final surahId = state.extra as int;
      return AyahScreen(surahNumber: surahId);
    },
  ),
]);
