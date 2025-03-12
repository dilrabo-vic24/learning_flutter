import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:test_lesson/counter_screen.dart';

void main() {
  group("Counter test", () {
    late CounterController counterController;

    setUp(() {
      Get.testMode = true;
      counterController = Get.put(CounterController());
    });

    tearDown(() {
      Get.delete<CounterController>(); 
    });

    test("Initial count should be zero", () {
      expect(counterController.count.value, 0);
    });

    test("Increment", () {
      counterController.increment();
      expect(counterController.count.value, 1);
    });

    test("Decrement", () {
      counterController.increment(); // 1
      counterController.increment(); // 2
      counterController.decrement(); // 1
      expect(counterController.count.value, 1);
    });

    test('Reset', () {
      counterController.increment(); // 1
      counterController.reset();
      expect(counterController.count.value, 0);
    });
  });
}
