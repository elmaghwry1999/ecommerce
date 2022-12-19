class SignWithGoogleException implements Exception {
  SignWithGoogleException({this.message});
  String? message;
}

class UnAuthorizedException implements Exception {
  UnAuthorizedException({this.message});
  String? message;
}

class InternalServerException implements Exception {
  InternalServerException({this.message});
  String? message;
}

class NoInternetException implements Exception {
  NoInternetException({this.message});
  String? message;
}

class SharedPreferencesException implements Exception {
  SharedPreferencesException({this.message});
  String? message;
}
