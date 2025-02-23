import 'package:flutter_riverpod/flutter_riverpod.dart';

final messageProvider = StateProvider<String>(
  (ref) => "This is first State Provider message",
);
