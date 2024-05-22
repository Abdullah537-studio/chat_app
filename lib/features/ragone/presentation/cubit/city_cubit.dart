import 'package:chat_2/core/enum/cubit_enum.dart';
import 'package:chat_2/features/ragone/domain/entities/city_entity.dart';
import 'package:chat_2/features/ragone/domain/usecases/city_useCases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'city_state.dart';

class CityCubit extends Cubit<CityState> {
  final GetAllCityUseCase cityUseCase;

  CityCubit(this.cityUseCase) : super(CityState.initial());

  getAllCity(int selectedCountryId) async {
    List<ListCityEntity> filterCityOfCountry = [];
    CityEntity city = CityEntity(result: filterCityOfCountry);
    emit(state.copyWith(status: CubitStatus.loading, cityEntity: city));

    var cityData = await cityUseCase();
    cityData.fold((failure) {
      try {
        emit(state.copyWith(
          status: CubitStatus.faild,
          message: failure.response!.body,
        ));
      } catch (e) {
        emit(state.copyWith(status: CubitStatus.faild, message: e.toString()));
      }
    }, (data) {
      filterCityOfCountry = data.result
          .where((city) => city.countryId == selectedCountryId)
          .toList();
      city.result = filterCityOfCountry;
      emit(state.copyWith(status: CubitStatus.done, cityEntity: city));
    });
  }
}
