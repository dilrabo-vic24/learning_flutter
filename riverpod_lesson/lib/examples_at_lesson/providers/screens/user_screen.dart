import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_lesson/examples_at_lesson/providers/user_model.dart';

class UserScreen extends ConsumerWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userRiv = ref.watch(userRiverpod);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            userRiv.name,
            style: TextStyle(fontSize: 25),
          ),
          TextButton(
              onPressed: () {
                ref.read(userRiverpod.notifier).updateName("Dilrabo");
                log(ref.read(userRiverpod).name);
              },
              child: Text("Change the name"))
        ],
      ),
    );
  }
}
