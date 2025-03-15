import 'package:solid_lesson_todo/features/get_tasks/data/source/remote_datasource.dart';
import 'package:solid_lesson_todo/features/get_tasks/domain/model/task_model.dart';
import 'package:solid_lesson_todo/features/get_tasks/domain/repos/task_repo.dart';

class RemoteTaskRepoImpl implements ReadOnlyTaskRepo, WriteOnlyTaskRepo {
  final RemoteDatasource remoteDatasource;

  RemoteTaskRepoImpl({required this.remoteDatasource});

  @override
  Future<TaskModel> addTodo({required int userId, required String title}) {
    return remoteDatasource.addTodo(userId: userId, title: title);
  }

  @override
  Future<List<TaskModel>> getAllTodos() {
    return remoteDatasource.getTodos();
  }
}