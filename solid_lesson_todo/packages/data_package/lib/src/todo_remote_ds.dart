import 'dart:developer';

import 'package:data_package/src/task_model.dart';
import 'package:dio/dio.dart';


class TodoRemoteDatasource {
  final Dio dio;
  final String url = "https://jsonplaceholder.typicode.com/todos";

  TodoRemoteDatasource({required this.dio});

  Future<List<TaskModel>> getTodos() async {
    try {
      final response = await dio.get(url);
      return (response.data as List)
          .map((json) => TaskModel.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception("Failed to load todos");
    }
  }

  Future<TaskModel> addTodo({
    required int userId,
    required String title,
  }) async {
    try {
      final todo = {
        "userId": userId,
        "id": 1,
        "title": title,
        "completed": false,
      };
      final response = await dio.post(url, data: todo);
      log("respones: $response");
      return TaskModel.fromJson(response.data);
    } catch (e) {
      throw Exception("Failed to add todo");
    }
  }

  Future<Map<String, dynamic>> updateTodo({
    required int id,
    required int userId,
    required String title,
    required bool completed,
  }) async {
    try {
      final updatedTodo = {
        "userId": userId,
        "id": id,
        "title": title,
        "completed": completed,
      };
      final response = await dio.put("$url/$id", data: updatedTodo);
      log("response: $response");
      return response.data;
    } catch (e) {
      throw Exception("Failed to update todo");
    }
  }

  Future<void> deleteTodo(int id) async {
    try {
      final response = await dio.delete("$url/$id");
      log("Deleted Todo: $response");
    } catch (e) {
      throw Exception("Failed to delete todo");
    }
  }
}
