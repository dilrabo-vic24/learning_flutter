import 'package:flutter_riverpod/flutter_riverpod.dart';

final autoDisposeMessageProvider = Provider.autoDispose(
  (ref) => 'AutoDisposeProvider Message',
);
