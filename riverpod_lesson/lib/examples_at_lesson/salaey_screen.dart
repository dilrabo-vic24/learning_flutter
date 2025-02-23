import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_lesson/examples_at_lesson/riverpod_example.dart';

class SalaeyScreen extends ConsumerWidget {
  const SalaeyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final salaryPv = ref.watch(salaryProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Salary: $salaryPv"),
      ),
      body: TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
        ),
        onChanged: (value) {
          ref.read(salaryProvider.notifier).update(
                (state) => state = double.parse(value),
              );
        },
      ),
    );
  }
}
