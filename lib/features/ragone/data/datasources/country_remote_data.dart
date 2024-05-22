import 'package:chat_2/core/api/api_links.dart';
import 'package:chat_2/core/api/api_methods.dart';
import 'package:chat_2/core/error/exception.dart';
import 'package:chat_2/features/ragone/domain/entities/city_entity.dart';
import 'package:chat_2/features/ragone/domain/entities/country_entity.dart';
import 'package:flutter/material.dart';

abstract class CountryRemoteDataSource {
  Future<CountryEntity> getAllCountry();
  Future<CityEntity> getAllCity();
}

class CountryRemoteDataSourceImpl implements CountryRemoteDataSource {
  @override
  Future<CountryEntity> getAllCountry() async {
    var response = await ApiMethods().get(
      url: ApiGet.countryUrl,
      path: {},
      query: {},
    );

    debugPrint(response.body);
    if (response.statusCode == 200) {
      return countryFromJson(response.body);
    } else {
      throw ServerException(response: response);
    }
  }

  @override
  Future<CityEntity> getAllCity() async {
    var response =
        await ApiMethods().get(url: ApiGet.cityUrl, path: {}, query: {});
    debugPrint(response.body);

    if (response.statusCode == 200) {
      // return cityFromJson(response.body);
      return cityFromJson(response.body);
    } else {
      throw ServerException(response: response);
    }
  }
}
