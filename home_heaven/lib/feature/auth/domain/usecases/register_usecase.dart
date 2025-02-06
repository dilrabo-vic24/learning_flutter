import 'package:dartz/dartz.dart';
import 'package:home_heaven/feature/auth/domain/repos/auth_repo.dart';

class RegisterUsecase {
  final AuthRepo authRepo;

  RegisterUsecase({required this.authRepo});

  Future<Either<dynamic, bool>> call({
    required String phoneNumber,
    required String email,
    required String password,
  }) {
    return authRepo.register(
      phoneNumber: phoneNumber,
      email: email,
      password: password,
    );
  }
}
