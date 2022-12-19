import 'package:dartz/dartz.dart';

import 'auth_dao.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthDaoImpl implements AuthDao {
  AuthDaoImpl({required this.prefs});

  final SharedPreferences prefs;

  @override
  Future<Unit> saveToken(Token token) async {
    await prefs.setString('token', token);

    return Future.value(unit);
  }

  @override
  Future<Token> get token async => prefs.getString('token') as Token;
}
