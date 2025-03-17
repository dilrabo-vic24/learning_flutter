
import 'package:data_package/data_package.dart';
import 'package:repository_package/repository_package.dart';

class AddTodoUsecase {
  final WriteOnlyTaskRepo writeOnlyTaskRepo;

  AddTodoUsecase({required this.writeOnlyTaskRepo});

  Future<TaskModel> call({required int userId, required String title}) async {
    return await writeOnlyTaskRepo.addTodo(userId: userId, title: title);
  }
}
