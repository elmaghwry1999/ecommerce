import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../data/data_source/remote/request/user_login_req.dart';
import '../../data/data_source/remote/response/user_login_res.dart';
import '../../data/data_source/remote/response/user_register_res.dart';

typedef Password = String;

abstract class AuthRepository {
  Future<Either<Failure, UserRegisterRes>> registerNewUser({required Password password});

  Future<Either<Failure, UserLoginRes>> login({required UserLoginReq userLoginReq});
}
