import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_lesson/homework/providers/state_provider.dart';

class StateProviderScreen extends ConsumerWidget {
  const StateProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messageRiverpod = ref.watch(messageProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("State Provider"),
      ),
      body: Column(
        children: [
          Center(
            child: Text(messageRiverpod),
          ),
          ElevatedButton(
            onPressed: () {
              ref.watch(messageProvider.notifier).state =
                  "New State Provider message";
            },
            child: Text("Update Message"),
          ),
        ],
      ),
    );
  }
}
