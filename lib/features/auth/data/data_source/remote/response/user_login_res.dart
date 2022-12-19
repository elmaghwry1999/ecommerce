import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart' show immutable;

@immutable
class UserLoginRes extends Equatable {
  const UserLoginRes(
      {required this.id,
      required this.fullName,
      required this.emailOrPhone,
      required this.accessToken});

  final String? id;
  final String? fullName;
  final String? emailOrPhone;

  final String accessToken;

  factory UserLoginRes.fromJson(Map<String, dynamic> json) {
    return UserLoginRes(
        id: json['_id'],
        fullName: json['full_name'],
        emailOrPhone: json['email_or_phone'],
        accessToken: json['accessToken']);
  }

  @override
  List<Object?> get props => [id, fullName, emailOrPhone, accessToken];
}
