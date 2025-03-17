import 'package:solid_lesson_todo/features/get_tasks/domain/model/task_model.dart';

abstract class ReadOnlyTaskRepo {
  Future<List<TaskModel>> getAllTodos();
}

abstract class WriteOnlyTaskRepo {
  Future<TaskModel> addTodo({required int userId, required String title});
  
  Future<Map<String, dynamic>> updateTodo({
    required int id,
    required int userId,
    required String title,
    required bool completed,
  });

  Future<void> deleteTodo(int id);
}
