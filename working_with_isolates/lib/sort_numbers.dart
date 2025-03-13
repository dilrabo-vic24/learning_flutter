import 'dart:isolate';

Future<List<dynamic>> generateAndSortNumbers(int countNumbers)async{
  final receivePort = ReceivePort();
  await Isolate.spawn(sortNumbers, receivePort.sendPort);

  final sendPort = await receivePort.first;
  final response = ReceivePort();
  sendPort.
}