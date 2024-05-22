// ignore_for_file: must_be_immutable

import 'package:chat_2/core/enum/cubit_enum.dart';
import 'package:chat_2/core/strings/key_translate_manger.dart';
import 'package:chat_2/features/auth/presentation/widgets/custom_dropDownButton.dart';
import 'package:chat_2/features/ragone/presentation/cubit/city_cubit.dart';
import 'package:chat_2/features/ragone/presentation/cubit/country_cubit.dart';
import 'package:chat_2/features/ragone/presentation/widgets/custom_city_state_not_done.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomCountryGet extends StatelessWidget {
  final Function(int) onCitySelected;
  final Function(int) onCountrySelected;
  CustomCountryGet({
    super.key,
    required this.onCitySelected,
    required this.onCountrySelected,
  });

  List<DropdownMenuItem<String>> dropdownItemscountry = [];

  List<DropdownMenuItem<String>> dropdownItemscity = [];
  int selectedCountryId = 0;

  int selectedCityId = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //?----------------Country---------------------------------------
        BlocBuilder<CountryCubit, CountryState>(
          builder: (context, state) {
            dropdownItemscity = state.country.result.map((country) {
              return DropdownMenuItem(
                value: country.id.toString(),
                child: Text(country.name),
              );
            }).toList();
            return CustomDropdownButtonFormField(
              items: dropdownItemscity,
              label: state.status == CubitStatus.done
                  ? translating(context, AppKeyTranslateManger.country)
                  : translating(context, AppKeyTranslateManger.please_wait),
              onChanged: (val) async {
                int countryId = int.parse(val!);
                selectedCountryId = countryId;
                dropdownItemscity = [];
                onCountrySelected(selectedCountryId);

                context.read<CityCubit>().getAllCity(selectedCountryId);
              },
            );
          },
        ),
        //?-----------------City-----------------------------------------
        BlocBuilder<CityCubit, CityState>(
          builder: (context, state) {
            if (state.status == CubitStatus.done) {
              dropdownItemscity = state.cityEntity.result
                  .map((city) => DropdownMenuItem(
                      value: city.id.toString(), child: Text(city.name)))
                  .toList();
            } else if (state.status == CubitStatus.loading) {
              dropdownItemscity = [];
            }
            if (state.status == CubitStatus.done) {
              return CustomDropdownButtonFormField(
                  items: dropdownItemscity,
                  label: state.status == CubitStatus.done &&
                          state.status != CubitStatus.faild
                      ? translating(context, AppKeyTranslateManger.city)
                      : translating(context, AppKeyTranslateManger.please_wait),
                  onChanged: (val) {
                    selectedCityId = int.parse(val ?? "0");
                    onCitySelected(selectedCityId);
                  });
            } else if (state.status == CubitStatus.loading) {
              return CustomCityStateIsNotDone(
                text: translating(context, AppKeyTranslateManger.please_wait),
              );
            } else {
              return CustomCityStateIsNotDone(
                text: translating(context, AppKeyTranslateManger.city),
              );
            }
          },
        ),
      ],
    );
  }
}
