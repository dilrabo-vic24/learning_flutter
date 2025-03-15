import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'package:solid_lesson_todo/features/get_tasks/data/repos/remote_task_repo.dart';
import 'package:solid_lesson_todo/features/get_tasks/data/source/remote_datasource.dart';
import 'package:solid_lesson_todo/features/get_tasks/domain/repos/task_repo.dart';
import 'package:solid_lesson_todo/features/get_tasks/domain/usecase/add_todo_usecase.dart';
import 'package:solid_lesson_todo/features/get_tasks/domain/usecase/get_todos_usecase.dart';

final getIT = GetIt.instance;

void init() {
  getIT.registerLazySingleton<Dio>(() => Dio());

  getIT
    ..registerLazySingleton<RemoteDatasource>(
      () => RemoteDatasource(dio: getIT<Dio>()),
    )
    ..registerLazySingleton<WriteOnlyTaskRepo>(
      () => RemoteTaskRepoImpl(remoteDatasource: getIT<RemoteDatasource>()),
    )
    ..registerLazySingleton<ReadOnlyTaskRepo>(
      () => RemoteTaskRepoImpl(remoteDatasource: getIT<RemoteDatasource>()),
    )
    ..registerLazySingleton(() => GetTodosUsecase(readOnlyTaskRepo: getIT()))
    ..registerLazySingleton(() => AddTodoUsecase(writeOnlyTaskRepo: getIT()));
}
