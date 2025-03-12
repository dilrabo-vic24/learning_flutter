import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:test_lesson/counter_screen.dart';

void main() {
  testWidgets(
    "Counter screen test",
    (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: CounterScreen(),
      ));

      expect(find.text("0"), findsOneWidget);
      expect(find.text("1"), findsNothing);

      await tester.tap(find.byKey(Key("increment_button")));
      await tester.pump();

      expect(find.text('0'), findsNothing);
      expect(find.text('1'), findsOneWidget);

      await tester.tap(find.byKey(Key('decrement_button')));
      await tester.pump();

      expect(find.text('1'), findsNothing);
      expect(find.text('0'), findsOneWidget);

      testWidgets(
        "Counter zero",
        (WidgetTester tester) async {
          await tester.pumpWidget(GetMaterialApp(
            home: CounterScreen(),
          ));

          expect(find.text("0"), findsOneWidget);

          await tester.tap(find.byKey(Key("decrement_button")));
          await tester.pump();

          expect(find.text("0"), findsOneWidget);
        },
      );
    },
  );
}
