import 'dart:async';
import 'dart:isolate';
import 'dart:math';
import 'package:flutter/material.dart';

class SortNumbersProvider extends ChangeNotifier {
  bool isLoading = false;
  double sortTime = 0.0;
  List<int> sortedNumbers = [];

  Future<void> sortNumbers(int count) async {
    if (count <= 0) return;

    isLoading = true;
    notifyListeners();

    final result = await generateAndSortNumbers(count);

    sortTime = result[0];
    sortedNumbers = result[1];
    isLoading = false;
    notifyListeners();
  }

  Future<List<dynamic>> generateAndSortNumbers(int count) async {
    final receivePort = ReceivePort();
    await Isolate.spawn(_sortNumbers, receivePort.sendPort);

    final sendPort = await receivePort.first as SendPort;
    final response = ReceivePort();

    sendPort.send([count, response.sendPort]);

    final result = await response.first;

    receivePort.close();
    response.close();

    return result;
  }

  static void _sortNumbers(SendPort sendPort) async {
    final receivePort = ReceivePort();
    sendPort.send(receivePort.sendPort);

    await for (var message in receivePort) {
      if (message is List) {
        final count = message[0] as int;
        final responsePort = message[1] as SendPort;

        final stopwatch = Stopwatch()..start();

        final random = Random();
        List<int> numbers =
            List.generate(count, (_) => random.nextInt(1000000));

        numbers.sort();
        stopwatch.stop();

        responsePort.send(
            [stopwatch.elapsedMilliseconds / 1000, numbers.take(10).toList()]);
      }
    }
  }
}
