import 'package:dartz/dartz.dart';
import '../../../../core/error/exception.dart';

import '../../../../core/error/failure.dart';
import '../data_source/auth_service/auth_service.dart';
import '../data_source/local/auth_dao.dart';
import '../data_source/remote/request/user_login_req.dart';
import '../data_source/remote/request/user_register_req.dart';
import '../data_source/remote/response/user_login_res.dart';
import '../data_source/remote/response/user_register_res.dart';
import '../../domain/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required this.authDao,
    required this.authService,
  });
  final AuthDao authDao;
  final AuthService authService;

  @override
  Future<Either<Failure, UserRegisterRes>> registerNewUser({required Password password}) async {
    try {
      final User user = await authService.signInWithGoogleAccount();
      final UserRegisterReq userRegisterReq = UserRegisterReq(
        fullName: user.displayName,
        emailOrPhone: user.email,
        password: password,
      );
      final UserRegisterRes result =
          await authService.registerNewUser(userRegisterReq);
      return Right(result);
    } on NoInternetException catch (e) {
      return Left(NoInternetFailure(message: e.message));
    } on SignWithGoogleException catch (e) {
      return Left(SignWithGoogleFailure(message: e.message));
    } on UnAuthorizedException catch (e) {
      return Left(UnAuthorizedFailure(message: e.message));
    } catch (e) {
      //TODO: remove hard code
      return Left(UnKnownFailure(message: 'un Known exception'));
    }
  }

  @override
  Future<Either<Failure, UserLoginRes>> login({required UserLoginReq userLoginReq})async {

    try {
         userLoginReq = UserLoginReq(
        emailOrPhone: userLoginReq.emailOrPhone ,
        password: userLoginReq.password
      );
      final UserLoginRes result =
      await authService.login(userLoginReq);
      return Right(result);
    } on NoInternetException catch (e) {
      return Left(NoInternetFailure(message: e.message));
    } on SignWithGoogleException catch (e) {
      return Left(SignWithGoogleFailure(message: e.message));
    } on UnAuthorizedException catch (e) {
      return Left(UnAuthorizedFailure(message: e.message));
    } catch (e) {
      return Left(UnKnownFailure(message: 'un Known exception'));
    }
  }
}
