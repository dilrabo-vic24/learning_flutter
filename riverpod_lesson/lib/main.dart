import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_lesson/homework/screens/auto_dispose_screen.dart';
import 'package:riverpod_lesson/homework/screens/change_notifier_provider_screen.dart';
import 'package:riverpod_lesson/homework/screens/examples_screen.dart';
import 'package:riverpod_lesson/homework/screens/family_provider_screen.dart';
import 'package:riverpod_lesson/homework/screens/future_provider_screen.dart';
import 'package:riverpod_lesson/homework/screens/provider_screen.dart';
import 'package:riverpod_lesson/homework/screens/scope_provider_screen.dart';
import 'package:riverpod_lesson/homework/screens/state_notifier_pv_screen.dart';
import 'package:riverpod_lesson/homework/screens/state_provider.dart';
import 'package:riverpod_lesson/homework/screens/stream_provider_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: ExamplesScreen(),
        routes: {
          '/provider': (context) => const ProviderScreen(),
          '/state_provider': (context) => const StateProviderScreen(),
          '/state_notifier_provider': (context) =>
              const StateNotifierPvScreen(),
          '/change_notifier_provider': (context) =>
              const ChangeNotifierProviderScreen(),
          '/future_provider': (context) => const FutureProviderScreen(),
          '/stream_provider': (context) => const StreamProviderScreen(),
          '/auto_dispose_provider': (context) =>
              const AutoDisposeProviderScreen(),
          '/family_provider': (context) => const FamilyProviderScreen(),
          '/scoped_provider': (context) => const ScopeProviderScreen(),
        },
      ),
    );
  }
}
