// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

import 'dart:convert';

CityEntity cityFromJson(String str) => CityEntity.fromJson(json.decode(str));

class CityEntity extends Equatable {
  CityEntity({
    required this.result,
  });

  List<ListCityEntity> result = [];

  factory CityEntity.fromJson(Map<String, dynamic> json) {
    return CityEntity(
      result: json["result"] == null
          ? []
          : List<ListCityEntity>.from(
              json["result"]!.map((x) => ListCityEntity.fromJson(x))),
    );
  }

  @override
  List<Object?> get props => [result];
}

class ListCityEntity extends Equatable {
  const ListCityEntity({
    required this.countryId,
    required this.countryName,
    required this.name,
    required this.id,
  });

  final int countryId;
  final String countryName;
  final String name;
  final int id;

  factory ListCityEntity.fromJson(Map<String, dynamic> json) {
    return ListCityEntity(
      countryId: json["countryId"] ?? 0,
      countryName: json["countryName"] ?? "",
      name: json["name"] ?? "",
      id: json["id"] ?? 0,
    );
  }

  @override
  List<Object?> get props => [
        countryId,
        countryName,
        name,
        id,
      ];
}
