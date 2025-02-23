import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TextChangeNotifier extends ChangeNotifier {
  String firstText =
      "Hello world. This is an example of ChangeNotifierProvider";

  void updateText({required String newText}) {
    firstText = newText;
    notifyListeners();
  }
}

final textChangeNotifier = ChangeNotifierProvider<TextChangeNotifier>(
  (ref) => TextChangeNotifier(),
);
