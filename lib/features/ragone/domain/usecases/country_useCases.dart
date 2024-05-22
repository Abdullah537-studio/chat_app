// ignore_for_file: file_names

import 'package:chat_2/core/error/failures.dart';
import 'package:chat_2/features/ragone/domain/entities/country_entity.dart';
import 'package:chat_2/features/ragone/domain/repositories/country_repository.dart';
import 'package:dartz/dartz.dart';

class GetAllCountryUseCase {
  final CountryAndCityRepository repository;

  const GetAllCountryUseCase({required this.repository});
  Future<Either<Failure, CountryEntity>> call() async {
    return await repository.getAllCountry();
  }
}
