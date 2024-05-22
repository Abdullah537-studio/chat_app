import 'package:chat_2/core/enum/cubit_enum.dart';
import 'package:chat_2/features/ragone/domain/entities/country_entity.dart';
import 'package:chat_2/features/ragone/domain/usecases/country_useCases.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:equatable/equatable.dart';

part 'country_state.dart';

class CountryCubit extends Cubit<CountryState> {
  final GetAllCountryUseCase countryUseCase;

  CountryCubit(this.countryUseCase) : super(CountryState.initial());
  CountryEntity? country;
  getAllCountry() async {
    emit(state.copyWith(status: CubitStatus.loading, country: country));

    var countryData = await countryUseCase();
    countryData.fold((failure) {
      try {
        emit(state.copyWith(
            status: CubitStatus.faild,
            message: failure.response!.body,
            country: country));
      } catch (e) {
        emit(state.copyWith(status: CubitStatus.faild, message: e.toString()));
      }
    }, (data) {
      country = data;

      emit(state.copyWith(status: CubitStatus.done, country: data));
    });
  }

  getAllCity(
      List<DropdownMenuItem<String>> dropdownItemCity, int counterId) async {
    emit(state.copyWith(status: CubitStatus.loading, city: state.city));
    dropdownItemCity.addAll(country!.result
        .firstWhere((country) => country.id == counterId)
        .cities
        .map((city) {
      return DropdownMenuItem(
        value: city.id.toString(),
        child: Text(city.name),
      );
    }));

    emit(state.copyWith(
        status: CubitStatus.done, city: dropdownItemCity, country: country));
  }
}
