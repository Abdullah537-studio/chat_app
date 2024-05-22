loginRequestToJson(LoginRequest data) => data.toJson();

class LoginRequest {
  String? email;
  String? password;
  bool? rememberMe;
  LoginRequest({
    this.email = '',
    this.password = '',
    this.rememberMe = false,
  });

  Map<String, dynamic> toJson() {
    return {
      "userNameOrEmailAddress": email,
      "password": password,
      "rememberClient": rememberMe
    };
  }
}
