import 'package:solid_lesson_todo/features/get_tasks/domain/repos/task_repo.dart';

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
