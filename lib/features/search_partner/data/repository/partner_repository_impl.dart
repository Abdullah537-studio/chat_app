import 'package:chat_2/core/error/exception.dart';
import 'package:chat_2/core/error/failures.dart';
import 'package:chat_2/core/network/network_info.dart';
import 'package:chat_2/core/strings/error_strings.dart';
import 'package:chat_2/features/search_partner/data/datasources/search_partner_remote_data.dart';
import 'package:chat_2/features/search_partner/data/models/requiest/search_partner_requiest_model.dart';
import 'package:chat_2/features/search_partner/data/models/response/search_partner_response_model.dart';
import 'package:chat_2/features/search_partner/domain/repositories/search_partner_repository.dart';
import 'package:dartz/dartz.dart';

class SearchPartnerRepositoryImpl implements SearchPartnerRepository {
  final NetworkInfo networkInfo;
  final SearchPartnerRemoteData remoteData;
  const SearchPartnerRepositoryImpl({
    required this.networkInfo,
    required this.remoteData,
  });
  @override
  Future<Either<Failure, List<PartnerResponse>>> getAllPartnerResponse(
      {required PartnerRequiest partnerRequiest}) async {
    if (await networkInfo.isConnected) {
      try {
        final getPartnerData =
            await remoteData.partner(partnerRequiestModel: partnerRequiest);
        return Right(getPartnerData);
      } on ServerException catch (e) {
        return Left(
            Failure(error: serverExceptionString, response: e.response));
      }
    } else {
      return Left(Failure(error: offlineExceptionString));
    }
  }
}
