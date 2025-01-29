import 'package:ecommerce_revision/data/repositories/product_repo.dart';
import 'package:ecommerce_revision/providers/product_provider.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  getIt
    ..registerLazySingleton<ProductRepo>(() => ProductRepo())
    ..registerFactory<ProductProvider>(
        () => ProductProvider(productRepo: getIt()));
}
