import 'package:solid_lesson_todo/features/get_tasks/data/source/remote_datasource.dart';
import 'package:solid_lesson_todo/features/get_tasks/domain/model/task_model.dart';
import 'package:solid_lesson_todo/features/get_tasks/domain/repos/task_repo.dart';

class RemoteTaskRepoImpl implements ReadOnlyTaskRepo, WriteOnlyTaskRepo {
  final RemoteDatasource remoteDatasource;

  RemoteTaskRepoImpl({required this.remoteDatasource});

  @override
  Future<TaskModel> addTodo({
    required int userId,
    required String title,
  }) async {
    return await remoteDatasource.addTodo(userId: userId, title: title);
  }

  @override
  Future<List<TaskModel>> getAllTodos() async {
    return await remoteDatasource.getTodos();
  }

  @override
  Future<Map<String, dynamic>> updateTodo({
    required int id,
    required int userId,
    required String title,
    required bool completed,
  }) async {
    return await remoteDatasource.updateTodo(
      id: id,
      userId: userId,
      title: title,
      completed: completed,
    );
  }

  @override
  Future<void> deleteTodo(int id) async {
    return await remoteDatasource.deleteTodo(id);
  }
}
