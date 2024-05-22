import 'package:equatable/equatable.dart';
import 'dart:convert';

CountryEntity countryFromJson(String str) =>
    CountryEntity.fromJson(json.decode(str));

String countryToJson(CountryEntity data) => json.encode(data.toJson());

class CountryEntity extends Equatable {
  const CountryEntity({required this.result});

  final List<Result> result;

  factory CountryEntity.fromJson(Map<String, dynamic> json) {
    return CountryEntity(
      result: json["result"] == null
          ? []
          : List<Result>.from(json["result"]!.map((x) => Result.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "result": result.map((x) => x.toJson()).toList(),
      };

  @override
  List<Object?> get props => [result];
}

class Result extends Equatable {
  const Result({required this.name, required this.cities, required this.id});

  final String name;
  final List<City> cities;
  final int id;

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      name: json["name"] ?? "",
      cities: json["cities"] == null
          ? []
          : List<City>.from(json["cities"]!.map((x) => City.fromJson(x))),
      id: json["id"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "cities": cities.map((x) => x.toJson()).toList(),
        "id": id,
      };

  @override
  List<Object?> get props => [name, cities, id];
}

class City extends Equatable {
  const City({
    required this.countryId,
    required this.countryName,
    required this.name,
    required this.id,
  });

  final int countryId;
  final String countryName;
  final String name;
  final int id;

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      countryId: json["countryId"] ?? 0,
      countryName: json["countryName"] ?? "",
      name: json["name"] ?? "",
      id: json["id"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "countryId": countryId,
        "countryName": countryName,
        "name": name,
        "id": id,
      };

  @override
  List<Object?> get props => [countryId, countryName, name, id];
}
