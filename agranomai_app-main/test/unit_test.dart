import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Simple addition test', () {
    int result = add(2, 3);
    expect(result, 5);
  });
}

int add(int a, int b) {
  return a + b;
}