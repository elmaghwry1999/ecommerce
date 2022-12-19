import 'package:dartz/dartz.dart';
import '../repository/auth_repository.dart';

import '../../../../core/error/failure.dart';
import '../../data/data_source/remote/response/user_register_res.dart';

class RegisterNewUserUseCase {
  RegisterNewUserUseCase({required this.authRepository});
  final AuthRepository authRepository;
  Future<Either<Failure, UserRegisterRes>> call(
      {required Password password}) async {
    return authRepository.registerNewUser(password: password);
  }
}
