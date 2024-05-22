import 'package:chat_2/core/error/failures.dart';
import 'package:chat_2/features/search_partner/data/models/requiest/search_partner_requiest_model.dart';
import 'package:chat_2/features/search_partner/data/models/response/search_partner_response_model.dart';
import 'package:dartz/dartz.dart';

abstract class SearchPartnerRepository {
  Future<Either<Failure, List<PartnerResponse>>> getAllPartnerResponse(
      {required PartnerRequiest partnerRequiest});
}
