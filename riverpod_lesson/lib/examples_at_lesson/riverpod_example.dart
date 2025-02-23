import 'package:flutter_riverpod/flutter_riverpod.dart';

final nameProvider = Provider<String>(
  (ref) => "Dilrabo",
);

final salaryProvider = StateProvider<double>(
  (ref) {
    return 1000;
  },
);
