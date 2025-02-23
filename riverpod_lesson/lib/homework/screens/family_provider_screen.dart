import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_lesson/homework/providers/family_provider.dart';

class FamilyProviderScreen extends ConsumerWidget {
  const FamilyProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameRiverpod = ref.watch(familyProvider("Hello"));
    return Scaffold(
      appBar: AppBar(
        title: Text("Family Provider Example"),
      ),
      body: Center(
        child: Text(nameRiverpod),
      ),
    );
  }
}
