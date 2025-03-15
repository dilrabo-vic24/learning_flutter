import 'package:solid_lesson_todo/features/get_tasks/domain/model/task_model.dart';
import 'package:solid_lesson_todo/features/get_tasks/domain/repos/task_repo.dart';

class AddTodoUsecase {
  final WriteOnlyTaskRepo writeOnlyTaskRepo;

  AddTodoUsecase({required this.writeOnlyTaskRepo});

  Future<TaskModel> call({required int userId, required String title}) async {
    return await writeOnlyTaskRepo.addTodo(userId: userId, title: title);
  }
}
