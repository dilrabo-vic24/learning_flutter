import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserModel {
  String name;
  int age;
  String course;
  double salary;

  UserModel({
    required this.name,
    required this.age,
    required this.course,
    required this.salary,
  });

  UserModel.empty({
    this.age = 0,
    this.course = "",
    this.name = "",
    this.salary = 0,
  });
}

class UserNotifierRiverpod extends StateNotifier<UserModel> {
  UserNotifierRiverpod() : super(UserModel.empty());

  void updateName(String name) {
    state.name = name;
  }
}

final userRiverpod = StateNotifierProvider<UserNotifierRiverpod, UserModel>(
  (ref) => UserNotifierRiverpod(),
);
