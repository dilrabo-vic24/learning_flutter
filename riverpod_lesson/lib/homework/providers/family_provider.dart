import 'package:flutter_riverpod/flutter_riverpod.dart';

final familyProvider = Provider.family<String, String>(
  (ref, name) {
    return "$name, this is Family Provider example";
  },
);
