import 'package:flutter_riverpod/flutter_riverpod.dart';

class NamesListState extends StateNotifier<List<String>> {
  NamesListState() : super([]);

  void addName({required String name}) {
    state = [...state, name];
  }
}

final namesListProvider = StateNotifierProvider<NamesListState, List<String>>(
  (ref) => NamesListState(),
);
