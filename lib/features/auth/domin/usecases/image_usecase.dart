import 'package:chat_2/core/error/failures.dart';
import 'package:chat_2/features/auth/domin/entites/image_partner_model/response/image_partner_response.dart';
import 'package:chat_2/features/auth/domin/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class ImagePartnerUseCase {
  final AuthRepository repository;

  ImagePartnerUseCase({required this.repository});
  Future<Either<Failure, ImagePartnerResponse>> call() async {
    return repository.imagePartner();
  }
}
