part of 'country_cubit.dart';

class CountryState extends Equatable {
  final CubitStatus status;
  final String message;
  final List<DropdownMenuItem<String>>? city;
  final CountryEntity country;
  const CountryState(
      {required this.status,
      required this.message,
      required this.country,
      this.city});

  factory CountryState.initial() {
    return const CountryState(
        status: CubitStatus.initial,
        message: '',
        city: [],
        country: CountryEntity(result: []));
  }

  CountryState copyWith(
      {String? message,
      CubitStatus? status,
      CountryEntity? country,
      List<DropdownMenuItem<String>>? city}) {
    return CountryState(
      city: city ?? this.city,
      message: message ?? this.message,
      status: status ?? this.status,
      country: country ?? this.country,
    );
  }

  @override
  bool get stringify => true;
  @override
  List<Object> get props => [status, country, message, city!];
}
