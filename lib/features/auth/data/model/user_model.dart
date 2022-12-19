import 'package:flutter/foundation.dart' show immutable;

@immutable
class UserModel {
  const UserModel({
    required this.emailOrPhone,
    required this.fullName,
    required this.password,
  });
  final String emailOrPhone;
  final String fullName;
  final String password;
}
