import 'package:data_package/data_package.dart';
import 'package:get_it/get_it.dart';
import 'package:repository_package/repository_package.dart';

final getIT = GetIt.instance;

Future<void> init() async {
  getIT.registerLazySingleton<Dio>(() => Dio());

  getIT
    ..registerLazySingleton<TodoRemoteDatasource>(
      () => TodoRemoteDatasource(dio: getIT<Dio>()),
    )
    ..registerLazySingleton<WriteOnlyTaskRepo>(
      () => RemoteTaskRepoImpl(remoteDatasource: getIT<TodoRemoteDatasource>()),
    )
    ..registerLazySingleton<ReadOnlyTaskRepo>(
      () => RemoteTaskRepoImpl(remoteDatasource: getIT<TodoRemoteDatasource>()),
    )
    ..registerLazySingleton(() => GetTodosUsecase(readOnlyTaskRepo: getIT()))
    ..registerLazySingleton(() => AddTodoUsecase(writeOnlyTaskRepo: getIT()))
    ..registerLazySingleton(() => UpdateTodoUsecase(writeOnlyTaskRepo: getIT()))
    ..registerLazySingleton(
      () => DeleteTodoUsecase(writeOnlyTaskRepo: getIT()),
    );
}
