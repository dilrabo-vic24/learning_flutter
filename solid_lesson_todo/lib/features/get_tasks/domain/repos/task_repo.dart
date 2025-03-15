import 'package:solid_lesson_todo/features/get_tasks/domain/model/task_model.dart';

abstract class ReadOnlyTaskRepo {
  Future<List<TaskModel>> getAllTodos();
}

abstract class WriteOnlyTaskRepo {
  Future<TaskModel> addTodo({required int userId, required String title});
}
