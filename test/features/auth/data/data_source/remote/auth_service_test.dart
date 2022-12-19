import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:e_commerce/features/auth/data/data_source/remote/request/user_login_req.dart';
import 'package:e_commerce/features/auth/data/data_source/remote/response/user_login_res.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_sign_in_mocks/google_sign_in_mocks.dart';
import 'package:mocktail/mocktail.dart';

import 'package:e_commerce/core/network/network_helper.dart';
import 'package:e_commerce/features/auth/data/data_source/auth_service/auth_service.dart';
import 'package:e_commerce/features/auth/data/data_source/auth_service/auth_service_impl.dart';
import 'package:e_commerce/features/auth/data/data_source/remote/request/user_register_req.dart';
import 'package:e_commerce/features/auth/data/data_source/remote/response/user_register_res.dart';

import '../../../../../fextures/fixtures.dart';

class MockNetworkHelper extends Mock implements NetworkHelper {}

class MockDio extends Mock implements Dio {}

void main() {
  late MockNetworkHelper mockNetworkHelper;
  late MockDio mockDio;
  final mockGoogleSignIn = MockGoogleSignIn();
  final mockAuth = MockFirebaseAuth();

  late AuthService tAuthService;
  setUp(() {
    mockNetworkHelper = MockNetworkHelper();
    mockDio = MockDio();
    tAuthService = AuthServiceImpl(
      googleSignIn: mockGoogleSignIn,
      auth: mockAuth,
      dio: mockDio,
      networkHelper: mockNetworkHelper,
    );
  });

  group('test SignUp function', () {
    //final Map<String, dynamic> tMap = tJsonRes;
    test('should return userRegisterResponse when there is internet connection',
        () async {
      const UserRegisterReq tUserRegisterReq = UserRegisterReq(
        fullName: 'fullName',
        emailOrPhone: 'emailOrPhone',
        password: 'password',
      );
      const UserRegisterRes tUserRegisterRes = UserRegisterRes(
        id: 'test_id',
        fullName: 'test_full_name',
        emailOrPhone: 'test_email_or_phone',
        password: 'test_password',
      );

      final tJsonRes = json.decode(fixture('user_register_res.json'));
      // arrange
      when(
        () => mockNetworkHelper.isConnected,
      ).thenAnswer((_) async => true);

      when(() => mockDio.post('auth/register', data: tUserRegisterReq.toJson()))
          .thenAnswer((_) async => Response(
              data: tJsonRes,
              statusCode: 201,
              requestOptions: RequestOptions(path: 'auth/register')));
      // act
      final response = await tAuthService.registerNewUser(tUserRegisterReq);
      // assert

      expect(response, const TypeMatcher<UserRegisterRes>());
      expect(response, tUserRegisterRes);
    });

    test('should return userLoginRes when there is internet ', () async {
      const UserLoginReq tUserLoginReq =
          UserLoginReq(password: 'password', emailOrPhone: 'emailOrPhone');

      const UserLoginRes tUserLoginRes = UserLoginRes(
          id: 'test_id',
          fullName: 'test_full_name',
          emailOrPhone: 'test_email_or_phone',
          accessToken: 'test_accessToken');

      final tRespons = json.decode(fixture('user_login_res.json'));
      // arrange
      when(() => mockNetworkHelper.isConnected).thenAnswer((_) async => true);
      when(() => mockDio.post('auth/login', data: tUserLoginReq.toJson()))
          .thenAnswer(
        (_) async => Response(
            requestOptions: RequestOptions(path: 'auth/login'),
            data: tRespons,
            statusCode: 200),
      );
      // act
      final response = await tAuthService.login(tUserLoginReq);
      // assert
      expect(response, tUserLoginRes);
    });
  });
}
