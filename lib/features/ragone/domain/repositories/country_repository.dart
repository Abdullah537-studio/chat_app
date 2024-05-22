import 'package:chat_2/core/error/failures.dart';
import 'package:chat_2/features/ragone/domain/entities/city_entity.dart';
import 'package:chat_2/features/ragone/domain/entities/country_entity.dart';
import 'package:dartz/dartz.dart';

abstract class CountryAndCityRepository {
  Future<Either<Failure, CountryEntity>> getAllCountry();
  Future<Either<Failure, CityEntity>> getAllcity();
}
