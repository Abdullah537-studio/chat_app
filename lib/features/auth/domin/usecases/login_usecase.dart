import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entites/auth_model/requiest/login_request_entity.dart';
import '../entites/auth_model/response/login_response_entity.dart';
import '../repository/auth_repository.dart';

class LoginUsecase {
  final AuthRepository repository;

  const LoginUsecase({required this.repository});

  Future<Either<Failure, LoginResponse>> call(
      {required LoginRequest loginEntite}) async {
    return await repository.login(loginEntite: loginEntite);
  }
}
