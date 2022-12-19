import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show immutable;

import '../remote/request/user_login_req.dart';
import '../remote/request/user_register_req.dart';
import '../remote/response/user_login_res.dart';
import '../remote/response/user_register_res.dart';

@immutable
abstract class AuthService {
  Future<User> signInWithGoogleAccount();
  Future<UserRegisterRes> registerNewUser(UserRegisterReq userRegisterReq);
  Future<Unit> signOutFromFirebase();
  Future<UserLoginRes> login(UserLoginReq userLoginReq);
}
