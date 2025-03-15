import 'package:dio/dio.dart';

import 'package:solid_lesson_todo/features/get_tasks/domain/model/task_model.dart';

class RemoteDatasource {
  final Dio dio;
  final String url = "https://jsonplaceholder.typicode.com/todos";

  RemoteDatasource({required this.dio});

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
        "useId": userId,
        "id": 1,
        "title": title,
        "completed": false,
      };
      final response = await dio.post(url, data: todo);
      return TaskModel.fromJson(response.data);
    } catch (e) {
      throw Exception("Failed to add todo");
    }
  }
}
