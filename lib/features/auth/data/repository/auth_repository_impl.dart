import 'package:chat_2/core/error/failures.dart';
import 'package:chat_2/core/strings/error_strings.dart';
import 'package:chat_2/features/auth/data/datasources/remote/auth_remote.dart';
import 'package:chat_2/features/auth/domin/entites/auth_model/requiest/login_request_entity.dart';
import 'package:chat_2/features/auth/domin/entites/auth_model/requiest/signup_request_entity.dart';
import 'package:chat_2/features/auth/domin/entites/auth_model/response/login_response_entity.dart';
import 'package:chat_2/features/auth/domin/entites/auth_model/response/signup_response_entity.dart';
import 'package:chat_2/features/auth/domin/entites/image_partner_model/response/image_partner_response.dart';
import 'package:chat_2/features/auth/domin/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/network/network_info.dart';

class AuthRepositoryImpl implements AuthRepository {
  final NetworkInfo networkInformation;
  final AuhtRemote auhtRemote;

  AuthRepositoryImpl({
    required this.networkInformation,
    required this.auhtRemote,
  });

//!----------------------------LogIn--------------------------------------------
  @override
  Future<Either<Failure, LoginResponse>> login(
      {required LoginRequest loginEntite}) async {
    if (await networkInformation.isConnected) {
      try {
        final loginData = await auhtRemote.login(loginEntity: loginEntite);
        return Right(loginData);
      } on ServerException catch (e) {
        return Left(
            Failure(error: serverExceptionString, response: e.response));
      }
    } else {
      return Left(Failure(error: offlineExceptionString));
    }
  }

//!----------------------------SignUp------------------------------------------
  @override
  Future<Either<Failure, SigninResponse>> signin(
      {required SigninRequest signinEntite}) async {
    if (await networkInformation.isConnected) {
      try {
        final signinData = await auhtRemote.signin(signinEntity: signinEntite);
        return Right(signinData);
      } on ServerException catch (e) {
        return Left(
            Failure(error: serverExceptionString, response: e.response));
      }
    } else {
      return Left(Failure(error: offlineExceptionString));
    }
  }
//!----------------------------image partner------------------------------------

  @override
  Future<Either<Failure, ImagePartnerResponse>> imagePartner() async {
    if (await networkInformation.isConnected) {
      try {
        final imageData = await auhtRemote.imagePartner();
        return Right(imageData);
      } on ServerException catch (e) {
        return Left(
            Failure(error: serverExceptionString, response: e.response));
      }
    } else {
      return Left(Failure(error: offlineExceptionString));
    }
  }
}
