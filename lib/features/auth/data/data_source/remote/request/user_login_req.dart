import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;

@immutable
class UserLoginReq extends Equatable {
  const UserLoginReq({required this.password, required this.emailOrPhone});

  final String? emailOrPhone;
  final String? password;

  Map<String, dynamic> toJson() {
    return {'email_or_phone': emailOrPhone, 'password': password};
  }

  @override
  List<Object?> get props => [emailOrPhone, password];
}
