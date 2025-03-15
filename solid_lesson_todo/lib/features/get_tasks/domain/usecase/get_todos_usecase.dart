import 'package:solid_lesson_todo/features/get_tasks/domain/model/task_model.dart';
import 'package:solid_lesson_todo/features/get_tasks/domain/repos/task_repo.dart';

class GetTodosUsecase {
  final ReadOnlyTaskRepo readOnlyTaskRepo;

  GetTodosUsecase({required this.readOnlyTaskRepo});

  Future<List<TaskModel>> call()async{
    return await readOnlyTaskRepo.getAllTodos();
  }
}