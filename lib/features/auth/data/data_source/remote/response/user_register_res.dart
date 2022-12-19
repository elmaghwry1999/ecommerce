import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;

@immutable
class UserRegisterRes extends Equatable {
  const UserRegisterRes({
    required this.id,
    required this.fullName,
    required this.emailOrPhone,
    required this.password,
  });
  final String? id;
  final String? fullName;
  final String? emailOrPhone;
  final String? password;

  factory UserRegisterRes.fromJson(Map<String, dynamic> json) {
    return UserRegisterRes(
        emailOrPhone: json['email_or_phone'],
        fullName: json['full_name'],
        id: json['_id'],
        password: json['password']);
  }

  @override
  List<Object?> get props => [id, fullName, emailOrPhone, password];
}
