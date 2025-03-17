
import 'package:data_package/data_package.dart';
import 'package:repository_package/repository_package.dart';

class GetTodosUsecase {
  final ReadOnlyTaskRepo readOnlyTaskRepo;

  GetTodosUsecase({required this.readOnlyTaskRepo});

  Future<List<TaskModel>> call()async{
    return await readOnlyTaskRepo.getAllTodos();
  }
}