import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class UserRegisterReq extends Equatable {
  const UserRegisterReq({
    required this.fullName,
    required this.emailOrPhone,
    required this.password,
  });

  final String? fullName;
  final String? emailOrPhone;
  final String? password;

  factory UserRegisterReq.formJson(Map<String, dynamic> json) {
    return UserRegisterReq(
      fullName: json['full_name'],
      emailOrPhone: json['email_or_phone'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'full_name': fullName,
      'email_or_phone': emailOrPhone,
      'password': password,
    };
  }

  @override
  List<Object?> get props => [fullName, emailOrPhone, password];
}
