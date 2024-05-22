// ignore_for_file: file_names

import 'package:chat_2/core/error/failures.dart';
import 'package:chat_2/features/search_partner/data/models/requiest/search_partner_requiest_model.dart';
import 'package:chat_2/features/search_partner/data/models/response/search_partner_response_model.dart';
import 'package:chat_2/features/search_partner/domain/repositories/search_partner_repository.dart';
import 'package:dartz/dartz.dart';

class GetAllPartnerUseCase {
  final SearchPartnerRepository partnerRepository;

  const GetAllPartnerUseCase({required this.partnerRepository});
  Future<Either<Failure, List<PartnerResponse>>> call(
      {required PartnerRequiest partnerRequiest}) async {
    return await partnerRepository.getAllPartnerResponse(
        partnerRequiest: partnerRequiest);
  }
}
