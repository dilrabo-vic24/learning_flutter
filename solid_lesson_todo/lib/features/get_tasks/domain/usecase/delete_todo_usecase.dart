import 'package:solid_lesson_todo/features/get_tasks/domain/repos/task_repo.dart';

class DeleteTodoUsecase {
  final WriteOnlyTaskRepo writeOnlyTaskRepo;

  DeleteTodoUsecase({required this.writeOnlyTaskRepo});

  Future<void> call(int id) async {
    return await writeOnlyTaskRepo.deleteTodo(id);
  }
}
