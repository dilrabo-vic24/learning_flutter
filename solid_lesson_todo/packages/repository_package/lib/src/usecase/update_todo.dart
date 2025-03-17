import 'package:repository_package/repository_package.dart';

class UpdateTodoUsecase {
  final WriteOnlyTaskRepo writeOnlyTaskRepo;

  UpdateTodoUsecase({required this.writeOnlyTaskRepo});

  Future<Map<String, dynamic>> call({
    required int id,
    required int userId,
    required String title,
    required bool completed,
  }) async {
    return await writeOnlyTaskRepo.updateTodo(
      id: id,
      userId: userId,
      title: title,
      completed: completed,
    );
  }
}
