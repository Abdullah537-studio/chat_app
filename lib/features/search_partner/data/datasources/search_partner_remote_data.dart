import 'package:chat_2/core/api/api_links.dart';
import 'package:chat_2/core/api/api_methods.dart';
import 'package:chat_2/core/error/exception.dart';
import 'package:chat_2/features/search_partner/data/models/requiest/search_partner_requiest_model.dart';
import 'package:chat_2/features/search_partner/data/models/response/search_partner_response_model.dart';
import 'package:flutter/material.dart';

abstract class SearchPartnerRemoteData {
  Future<List<PartnerResponse>> partner(
      {required PartnerRequiest partnerRequiestModel});
}

class SearchPartnerRemoteDataImpl implements SearchPartnerRemoteData {
  @override
  Future<List<PartnerResponse>> partner(
      {required PartnerRequiest partnerRequiestModel}) async {
    var response = await ApiMethods().get(
      url: ApiGet.findPartnerUrl,
      query: findAPartnerRequiestToJson(partnerRequiestModel),
      path: {},
    );
    debugPrint(response.body);
    if (response.statusCode == 200) {
      return partnerFromJson(response.body).result;
    } else {
      throw ServerException(response: response);
    }
  }
}
