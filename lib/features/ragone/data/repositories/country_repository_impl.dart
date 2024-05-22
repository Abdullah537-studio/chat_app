import 'package:chat_2/core/error/exception.dart';
import 'package:chat_2/core/error/failures.dart';
import 'package:chat_2/core/network/network_info.dart';
import 'package:chat_2/core/strings/error_strings.dart';
import 'package:chat_2/features/ragone/data/datasources/country_remote_data.dart';
import 'package:chat_2/features/ragone/domain/entities/city_entity.dart';
import 'package:chat_2/features/ragone/domain/entities/country_entity.dart';
import 'package:chat_2/features/ragone/domain/repositories/country_repository.dart';
import 'package:dartz/dartz.dart';

class CountryRepositoryImpl implements CountryAndCityRepository {
  final CountryRemoteDataSource remoteData;
  final NetworkInfo networkInformation;

  const CountryRepositoryImpl(
      {required this.remoteData, required this.networkInformation});

  @override
  Future<Either<Failure, CountryEntity>> getAllCountry() async {
    if (await networkInformation.isConnected) {
      try {
        final remoteCountry = await remoteData.getAllCountry();
        return Right(remoteCountry);
      } on ServerException catch (e) {
        return Left(
            Failure(error: serverExceptionString, response: e.response));
      }
    } else {
      return Left(Failure(error: offlineExceptionString));
    }
  }

  @override
  Future<Either<Failure, CityEntity>> getAllcity() async {
    if (await networkInformation.isConnected) {
      try {
        final remoteCity = await remoteData.getAllCity();
        return Right(remoteCity);
      } on ServerException catch (e) {
        return Left(
            Failure(error: serverExceptionString, response: e.response));
      }
    } else {
      return Left(Failure(error: offlineExceptionString));
    }
  }
}
