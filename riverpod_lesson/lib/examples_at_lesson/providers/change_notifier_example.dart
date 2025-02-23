import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterProvider extends ChangeNotifier {
  int counterValue = 0;

  void increment() {
    counterValue++;
    notifyListeners();
  }

  void decrement() {
    counterValue--;
    notifyListeners();
  }
}

final counterProvider = ChangeNotifierProvider(
  (ref) => CounterProvider(),
);
