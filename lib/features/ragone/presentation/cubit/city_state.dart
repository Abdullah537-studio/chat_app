part of 'city_cubit.dart';

class CityState {
  final String message;
  final CubitStatus status;
  final CityEntity cityEntity;
  const CityState({
    required this.message,
    required this.status,
    required this.cityEntity,
  });

  factory CityState.initial() {
    return CityState(
      message: "",
      status: CubitStatus.initial,
      cityEntity: CityEntity(result: const []),
    );
  }

  CityState copyWith(
      {String? message,
      CubitStatus? status,
      CityEntity? cityEntity,
      List<ListCityEntity>? filteredCities}) {
    return CityState(
      cityEntity: cityEntity ?? this.cityEntity,
      message: message ?? this.message,
      status: status ?? this.status,
    );
  }
}
