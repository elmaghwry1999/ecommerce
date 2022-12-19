import 'package:flutter/foundation.dart' show immutable;

@immutable
class UserCreadntial {
  final String emailOrPhone;
  final String password;
  const UserCreadntial({
    required this.emailOrPhone,
    required this.password,
  });
}
