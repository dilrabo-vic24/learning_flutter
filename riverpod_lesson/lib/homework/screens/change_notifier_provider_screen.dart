import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_lesson/homework/providers/change_notifier_provider.dart';

class ChangeNotifierProviderScreen extends ConsumerStatefulWidget {
  const ChangeNotifierProviderScreen({super.key});

  @override
  ConsumerState<ChangeNotifierProviderScreen> createState() =>
      _ChangeNotifierProviderScreenState();
}

class _ChangeNotifierProviderScreenState
    extends ConsumerState<ChangeNotifierProviderScreen> {
  @override
  Widget build(BuildContext contex) {
    final textRiverpod = ref.watch(textChangeNotifier);
    return Scaffold(
      appBar: AppBar(
        title: Text("Change Notifier Provider"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(textRiverpod.firstText),
            ElevatedButton(
              onPressed: () {
                ref
                    .watch(textChangeNotifier.notifier)
                    .updateText(newText: "This is a new text");
              },
              child: Text("Update String"),
            ),
          ],
        ),
      ),
    );
  }
}
