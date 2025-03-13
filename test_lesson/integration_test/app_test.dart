import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:integration_test/integration_test.dart';
import 'package:test_lesson/counter_screen.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group("Counter integration test", () {
    testWidgets("Integration test", (WidgetTester tester) async {
      await tester.pumpWidget(GetMaterialApp(home: CounterScreen()));

      await tester.tap(find.byKey(Key("increment_button")));
      await tester.pumpAndSettle();
      expect(find.text("1"), findsOneWidget);

      await tester.tap(find.byKey(Key('increment_button')));
      await tester.pumpAndSettle();
      expect(find.text('2'), findsOneWidget);

      await tester.tap(find.byKey(Key('decrement_button')));
      await tester.pumpAndSettle();
      expect(find.text('1'), findsOneWidget);

      await tester.tap(find.byKey(Key('reset_button')));
      await tester.pumpAndSettle();
      expect(find.text('0'), findsOneWidget);
    });
  });
}
