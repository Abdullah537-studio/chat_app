import 'package:chat_2/core/error/failures.dart';
import 'package:chat_2/features/auth/domin/entites/auth_model/requiest/signup_request_entity.dart';
import 'package:chat_2/features/auth/domin/entites/auth_model/response/signup_response_entity.dart';
import 'package:chat_2/features/auth/domin/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class SigninUseCase {
  final AuthRepository repository;

  const SigninUseCase({required this.repository});

  Future<Either<Failure, SigninResponse>> call(
      {required SigninRequest signinEntite}) async {
    return await repository.signin(signinEntite: signinEntite);
  }
}
