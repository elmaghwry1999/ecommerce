import 'package:dartz/dartz.dart';

typedef Token = String;

abstract class AuthDao {
  Future<Unit> saveToken(Token token);

  Future<Token> get token;
}
