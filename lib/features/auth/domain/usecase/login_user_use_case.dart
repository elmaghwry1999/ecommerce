import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../data/data_source/remote/request/user_login_req.dart';
import '../../data/data_source/remote/response/user_login_res.dart';
import '../repository/auth_repository.dart';

class LoginUserUseCase {
  LoginUserUseCase({required this.authRepository});
  final AuthRepository authRepository;
  Future<Either<Failure, UserLoginRes>> call(
      {required UserLoginReq userLoginReq}) async {
    return authRepository.login(userLoginReq: userLoginReq);
  }
}
