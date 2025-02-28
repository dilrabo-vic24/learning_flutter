import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:getx_lesson/data/services/local_storaga_service.dart';
import 'package:getx_lesson/presentations/screens/product_screen.dart';

void main() async {
  await initServices();
  runApp(MyApp());
}

Future<void> initServices() async {
  await Get.putAsync(() => StorageService().init());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'MVVM GetX Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.purple,
          elevation: 0,
        ),
      ),
      home: ProductScreen(),
    );
  }
}
