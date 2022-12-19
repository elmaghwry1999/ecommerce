// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  get message;
  @override
  List<Object?> get props => [];
}

class UnAuthorizedFailure extends Failure {
  @override
  final String? message;
  UnAuthorizedFailure({
    this.message,
  });
  @override
  List<Object?> get props => [message];
}

class InternalServerFailure extends Failure {
  @override
  final String? message;
  InternalServerFailure({
    this.message,
  });
  @override
  List<Object?> get props => [message];
}

class SignWithGoogleFailure extends Failure {
  @override
  final String? message;
  SignWithGoogleFailure({
    this.message,
  });
  @override
  List<Object?> get props => [message];
}

class NoInternetFailure extends Failure {
  @override
  final String? message;
  NoInternetFailure({
    this.message,
  });
  @override
  List<Object?> get props => [message];
}

class UnKnownFailure extends Failure {
  UnKnownFailure({
    this.message,
  });
  @override
  final String? message;
  @override
  List<Object?> get props => [message];
}
