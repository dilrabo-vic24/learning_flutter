import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_lesson/examples_at_lesson/riverpod_example.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final namePv = ref.read(nameProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("data"),
      ),
    );
  }
}
