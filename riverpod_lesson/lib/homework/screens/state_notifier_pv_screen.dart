import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_lesson/homework/providers/state_notifier_provider.dart';

class StateNotifierPvScreen extends ConsumerWidget {
  const StateNotifierPvScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameRiverpod = ref.watch(namesListProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("State Notifier Example"),
      ),
      body: Center(
        child: Column(
          children: [
            const Text("Names"),
            for (String name in nameRiverpod) Text(name),
            ElevatedButton(
              onPressed: () {
                ref.read(namesListProvider.notifier).addName(name: "Dilrabo");
              },
              child: const Text("Add new name"),
            ),
          ],
        ),
      ),
    );
  }
}
