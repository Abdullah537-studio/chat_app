import 'package:chat_2/core/error/failures.dart';
import 'package:chat_2/features/auth/domin/entites/auth_model/requiest/login_request_entity.dart';
import 'package:chat_2/features/auth/domin/entites/auth_model/requiest/signup_request_entity.dart';
import 'package:chat_2/features/auth/domin/entites/auth_model/response/login_response_entity.dart';
import 'package:chat_2/features/auth/domin/entites/auth_model/response/signup_response_entity.dart';
import 'package:chat_2/features/auth/domin/entites/image_partner_model/response/image_partner_response.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  //?Login
  Future<Either<Failure, LoginResponse>> login(
      {required LoginRequest loginEntite});
  //?Signin
  Future<Either<Failure, SigninResponse>> signin(
      {required SigninRequest signinEntite});

  Future<Either<Failure, ImagePartnerResponse>> imagePartner();
}
