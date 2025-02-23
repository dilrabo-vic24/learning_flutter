import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_lesson/examples_at_lesson/providers/change_notifier_example.dart';

class CounterScreen extends ConsumerStatefulWidget {
  const CounterScreen({super.key});

  @override
  ConsumerState<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends ConsumerState<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    final counterPv = ref.watch(counterProvider);
    return Scaffold(
      body: Center(
        child: Text(
          counterPv.counterValue.toString(),
          style: TextStyle(fontSize: 30),
        ),
      ),
      floatingActionButton: Row(
        children: [
          FloatingActionButton(
            onPressed: () {
              counterPv.increment();
            },
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              counterPv.decrement();
            },
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
