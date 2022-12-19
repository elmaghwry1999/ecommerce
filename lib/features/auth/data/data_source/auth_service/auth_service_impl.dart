import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../../core/network/network_helper.dart';
import '../remote/request/user_login_req.dart';
import '../remote/response/user_login_res.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../../core/error/exception.dart';
import 'auth_service.dart';
import '../remote/request/user_register_req.dart';
import '../remote/response/user_register_res.dart';

class AuthServiceImpl implements AuthService {
  AuthServiceImpl({
    required this.googleSignIn,
    required this.auth,
    required this.dio,
    required this.networkHelper,
  });

  final GoogleSignIn googleSignIn;
  final FirebaseAuth auth;
  final Dio dio;
  final NetworkHelper networkHelper;

  @override
  Future<UserRegisterRes> registerNewUser(
      UserRegisterReq userRegisterReq) async {
    //? check internet connection
    if (!await networkHelper.isConnected) {
      //TODO: remove hard code
      throw NoInternetException(
        message:
            'no internet connection please check your connection and try again',
      );
    }
    final request =
        await dio.post('auth/register', data: userRegisterReq.toJson());
    if (request.statusCode != 201) {
      //TODO: remove hard coded
      throw InternalServerException(message: 'Un known error occurred !!');
    } else {
      final UserRegisterRes response = UserRegisterRes.fromJson(request.data);
      return Future.value(response);
    }
  }

  @override
  Future<User> signInWithGoogleAccount() async {
    //? check internet connection
    if (!await networkHelper.isConnected) {
      //TODO: remove hard coded
      throw NoInternetException(
        message:
            'no internet connection please check your connection and try again',
      );
    }
    //* start sign with google
    GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    if (googleSignInAccount == null) {
      //TODO: remove hard coded
      throw SignWithGoogleException(message: 'Empty Accounts');
    } else {
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      AuthCredential authCredential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );
      await auth.signInWithCredential(authCredential);

      if (auth.currentUser == null) {
        //TODO: remove hard coded
        throw UnAuthorizedException(message: 'you are un authorize');
      } else {
        User user = auth.currentUser!;
        return Future.value(user);
      }
    }
  }

  @override
  Future<Unit> signOutFromFirebase() async {
    //? check internet connection
    if (!await networkHelper.isConnected) {
      //TODO: remove hard coded
      throw NoInternetException(
        message:
            'no internet connection please check your connection and try again',
      );
    }
    if (auth.currentUser == null) {
      //TODO: remove hard code
      throw UnAuthorizedException(message: 'you are un authorize');
    } else {
      await googleSignIn.signOut();
      await auth.signOut();
      return Future.value(unit);
    }
  }

  @override
  Future<UserLoginRes> login(UserLoginReq userLoginReq) async {
//? check internet connection
    if (!await networkHelper.isConnected) {
      //TODO: remove hard code

      throw NoInternetException(
        message:
            'no internet connection please check your connection and try again',
      );
    }

    final request = await dio.post('auth/login', data: userLoginReq.toJson());

    if (request.statusCode != 200) {
      //TODO: remove hard code

      throw UnAuthorizedException(message: 'you are un authorize');
    } else {
      final UserLoginRes response = UserLoginRes.fromJson(request.data);
      return Future.value(response);
    }
  }
}
