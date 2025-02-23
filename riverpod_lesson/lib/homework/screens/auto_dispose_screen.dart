import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_lesson/homework/providers/auto_dispose_provider.dart';

class AutoDisposeProviderScreen extends ConsumerWidget {
  const AutoDisposeProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final message = ref.watch(autoDisposeMessageProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('AutoDisposeProvider Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(message),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}