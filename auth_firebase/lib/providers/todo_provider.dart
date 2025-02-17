import 'dart:developer';

import 'package:auth_firebase/data/todos_service.dart';
import 'package:flutter/material.dart';

class TodoProvider extends ChangeNotifier {
  final TodosService todoService;

  TodoProvider({required this.todoService});

  List<Map<String, dynamic>> allTodosList = [];
  bool isLoading = false;
  String message = "";

  //toggle iscomplited
  void toggleIsComplited({required bool isComplited}) async {
    isLoading = true;
    notifyListeners();
    isComplited = !isComplited;
    notifyListeners();
    isLoading = false;
  }

  //add new todo
  Future<bool> addNewTodo(
      {required String title, required bool isComplited}) async {
    isLoading = true;
    notifyListeners();
    try {
      final result =
          await todoService.addTodo(title: title, isComplited: isComplited);
      if (result) {
        message = "Succesfully added";
        await getAllTodos();
        isLoading = false;
        notifyListeners();
        return true;
      } else {
        message = "error while creating todo";
        isLoading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      log("error while adding todo: $e");
      message = "error while creating todo";
      isLoading = false;
      notifyListeners();

      return false;
    }
  }

  //get all todos
  Future<void> getAllTodos() async {
    isLoading = true;
    notifyListeners();
    try {
      todoService.getAllTodos().listen((todos) {
        allTodosList = List<Map<String, dynamic>>.from(todos);
        isLoading = false;
        notifyListeners();
      });
    } catch (e) {
      message = 'Error while getting todos: $e';
      isLoading = false;
      notifyListeners();
      log("error: $e");
    }
  }
}
