import 'package:equatable/equatable.dart';

import 'dart:convert';

SigninResponse signinResponseFromJson(String str) =>
    SigninResponse.fromJson(json.decode(str));

class SigninResponse extends Equatable {
  final bool canLogin;

  const SigninResponse({required this.canLogin});

  factory SigninResponse.fromJson(Map<String, dynamic> json) {
    return SigninResponse(canLogin: json["canLogin"] ?? false);
  }

  @override
  List<Object?> get props => [canLogin];
}
