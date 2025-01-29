import 'package:exam_month_3/common/utils/cache_helper.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  await initCache();
}

Future<void> initCache() async {
  final prefs = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(
    () => CacheHelper(preferences: prefs),
  );
}
