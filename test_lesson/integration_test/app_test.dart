import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group(
    "Counter integration test",
    () {
      testWidgets(
        "Integr test",
        (WidgetTester tester) async {
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
        },
      );
    },
  );
}
