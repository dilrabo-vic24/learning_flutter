
import 'package:repository_package/repository_package.dart';

class DeleteTodoUsecase {
  final WriteOnlyTaskRepo writeOnlyTaskRepo;

  DeleteTodoUsecase({required this.writeOnlyTaskRepo});

  Future<void> call(int id) async {
    return await writeOnlyTaskRepo.deleteTodo(id);
  }
}
