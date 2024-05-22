// ignore_for_file: file_names

import 'package:chat_2/core/error/failures.dart';
import 'package:chat_2/features/ragone/domain/entities/city_entity.dart';
import 'package:chat_2/features/ragone/domain/repositories/country_repository.dart';
import 'package:dartz/dartz.dart';

class GetAllCityUseCase {
  final CountryAndCityRepository repository;

  const GetAllCityUseCase({required this.repository});
  Future<Either<Failure, CityEntity>> call() async {
    return await repository.getAllcity();
  }
}
