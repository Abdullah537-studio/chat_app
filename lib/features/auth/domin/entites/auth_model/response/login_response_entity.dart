import 'dart:convert';

import 'package:equatable/equatable.dart';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

class LoginResponse extends Equatable {
  const LoginResponse({required this.result});

  final Result result;

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      result: Result.fromJson(json["result"] ?? {}),
    );
  }

  @override
  List<Object?> get props => [result];
}

class Result extends Equatable {
  const Result({
    required this.accessToken,
    required this.encryptedAccessToken,
    required this.expireInSeconds,
    required this.userId,
  });

  final String accessToken;
  final String encryptedAccessToken;
  final int expireInSeconds;
  final int userId;

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      accessToken: json["accessToken"] ?? "",
      encryptedAccessToken: json["encryptedAccessToken"] ?? "",
      expireInSeconds: json["expireInSeconds"] ?? 0,
      userId: json["userId"] ?? 0,
    );
  }

  List<Result> get id => [
        Result(
            accessToken: accessToken,
            encryptedAccessToken: encryptedAccessToken,
            expireInSeconds: expireInSeconds,
            userId: userId)
      ];

  @override
  List<Object?> get props => [
        userId,
        expireInSeconds,
        encryptedAccessToken,
        accessToken,
      ];
}
