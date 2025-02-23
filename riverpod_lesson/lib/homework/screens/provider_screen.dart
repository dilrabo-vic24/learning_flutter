import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_lesson/examples_at_lesson/riverpod_example.dart';

class ProviderScreen extends ConsumerWidget {
  const ProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameRiverpod = ref.read(nameProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider Example"),
      ),
      body: Center(
        child: Text(nameRiverpod),
      ),
    );
  }
}
