import 'dart:developer';
import 'package:data_package/data_package.dart';
import 'package:flutter/material.dart';
import 'package:repository_package/repository_package.dart';
import 'package:ui_package/ui_package.dart';

class TaskProvider extends ChangeNotifier {
  final GetTodosUsecase getTodosUsecase = getIT<GetTodosUsecase>();
  final AddTodoUsecase addTodoUsecase = getIT<AddTodoUsecase>();
  final UpdateTodoUsecase updateTodoUsecase = getIT<UpdateTodoUsecase>();
  final DeleteTodoUsecase deleteTodoUsecase = getIT<DeleteTodoUsecase>();

  List<TaskModel> tasks = [];
  bool isLoading = false;
  String? errorMessage;
  Future<void> fetchTodos() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      tasks = await getTodosUsecase.call();
      // log("tasks in provider: $tasks");
      // log("todos fetched");
    } catch (e) {
      errorMessage = "Failed to load todos";
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addTodo({required int userId, required String title}) async {
    isLoading = true;
    errorMessage = "";
    notifyListeners();

    try {
      final newTask = await addTodoUsecase.call(userId: userId, title: title);
      log(newTask.toString());
      tasks.add(newTask);
    } catch (e) {
      errorMessage = "Failed to add todo";
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateTodo({
    required int id,
    required int userId,
    required String title,
    required bool completed,
  }) async {
    isLoading = true;
    errorMessage = "";
    notifyListeners();

    try {
      final updatedTask = await updateTodoUsecase.call(
        id: id,
        userId: userId,
        title: title,
        completed: completed,
      );

      final index = tasks.indexWhere((task) => task.id == id);
      if (index != -1) {
        tasks[index] = TaskModel.fromJson(updatedTask);
      }
    } catch (e) {
      errorMessage = "Failed to update todo";
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> deleteTodo(int id) async {
    isLoading = true;
    errorMessage = "";
    notifyListeners();

    try {
      await deleteTodoUsecase.call(id);
      tasks.removeWhere((task) => task.id == id);
    } catch (e) {
      errorMessage = "Failed to delete todo";
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
