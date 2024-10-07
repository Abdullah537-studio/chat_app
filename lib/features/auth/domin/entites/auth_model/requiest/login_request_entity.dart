// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

loginRequestToJson(LoginRequest data) => data.toJson();

class LoginRequest extends Equatable {
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

  @override
  List<Object?> get props => [
        rememberMe,
        password,
        email,
      ];
}
