class UserCredentials {
  UserCredentials({
    required this.emailOrPhone,
    required this.password,
  });
  final String? emailOrPhone;
  final String? password;

  factory UserCredentials.fromJson(Map<String, dynamic> json) {
    return UserCredentials(
        emailOrPhone: json['emailOrPhone'], password: json['password']);
  }
  Map<String, dynamic> toJson() {
    return {
      'emailOrPhone': emailOrPhone,
      'password': password,
    };
  }
}
