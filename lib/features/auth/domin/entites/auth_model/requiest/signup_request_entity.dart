// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

signinRequestToJson(SigninRequest data) => data.toJson();

class SigninRequest extends Equatable {
  String? userNameSigninRequest;
  String? name;
  int? gender;
  int? age;
  int? cityId;
  int? countryId;
  String? phoneNumber;
  String? emailAddress;
  String? password;
  String? avatar;

  SigninRequest({
    this.name,
    this.gender,
    this.age,
    this.cityId,
    this.countryId,
    this.phoneNumber,
    this.emailAddress,
    this.password,
    this.avatar,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "gender": gender,
        "age": age,
        "cityId": countryId,
        "countryId": countryId,
        "phoneNumber": phoneNumber,
        "emailAddress": emailAddress,
        "password": password,
        "avatar": avatar
      };

  @override
  List<Object?> get props => [
        name,
        gender,
        age,
        cityId,
        countryId,
        phoneNumber,
        emailAddress,
        password,
        avatar,
      ];
}
