import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_lesson/homework/providers/scope_provider.dart';

class ScopeProviderScreen extends ConsumerWidget {
  const ScopeProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messageRiverpod = ref.read(scopeProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Scope Provider Example"),
      ),
      body: Center(
        child: Text(messageRiverpod),
      ),
    );
  }
}
