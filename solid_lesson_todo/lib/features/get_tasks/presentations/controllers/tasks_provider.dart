import 'dart:developer';
import 'package:flutter/material.dart';

import 'package:solid_lesson_todo/core/dependecy_injection.dart';
import 'package:solid_lesson_todo/features/get_tasks/domain/model/task_model.dart';
import 'package:solid_lesson_todo/features/get_tasks/domain/usecase/add_todo_usecase.dart';
import 'package:solid_lesson_todo/features/get_tasks/domain/usecase/get_todos_usecase.dart';

class TaskProvider extends ChangeNotifier {
  final GetTodosUsecase getTodosUsecase = getIT<GetTodosUsecase>();
  final AddTodoUsecase addTodoUsecase = getIT<AddTodoUsecase>();

  List<TaskModel> tasks = [];
  bool isLoading = false;
  String? errorMessage;

  Future<void> fetchTodos() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      tasks = await getTodosUsecase.call();
      log("tasks in provider: $tasks");
      log("todos fetched");
    } catch (e) {
      errorMessage = "Failed to load todos";
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addTodo({required int userId, required String title}) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final newTask = await addTodoUsecase.call(userId: userId, title: title);
      tasks.add(newTask);
    } catch (e) {
      errorMessage = "Failed to add todo";
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
