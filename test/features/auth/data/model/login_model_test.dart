import 'dart:convert';

import 'package:chat_2/core/function/json/json_read.dart';
import 'package:chat_2/features/auth/domin/entites/auth_model/requiest/login_request_entity.dart';
import 'package:chat_2/features/auth/domin/entites/auth_model/response/login_response_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // result is a login response
  const testloginResponseEntity = const Result(
    accessToken: "sadflkjsldfjks22222",
    encryptedAccessToken: "asdfasdf",
    expireInSeconds: 22,
    userId: 222,
  );
  LoginRequest testLoginRequiestEntity = LoginRequest();
//! this test must be if we have model and entitiy to test subclass is a auth entity but we create only enitity
  //? test('should be a subclass of auth entity', () async {
  //?   expect(testloginRequestEntity, isA<LoginRequest>());
  //?   expect(testloginResponseEntity, isA<LoginResponse>());
  //? });

  test("should return a valide model from json", () {
    // arrange
    final Map<String, dynamic> jsonMap =
        json.decode(readJson("helper/dummy_data/dummy_login_response.json"));
    // act
    final result = Result.fromJson(jsonMap);
    // expect
    expect(result, equals(testloginResponseEntity));
  });

  test(
    'should return a json map containing proper data',
    () async {
      // act
      final result = testLoginRequiestEntity.toJson();

      // assert
      final expectedJsonMap = {
        "userNameOrEmailAddress": "",
        "password": "",
        "rememberClient": false
      };

      expect(result, equals(expectedJsonMap));
    },
  );
}
