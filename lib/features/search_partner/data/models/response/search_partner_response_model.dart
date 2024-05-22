import 'dart:convert';

PartnerResponseList partnerFromJson(String str) =>
    PartnerResponseList.fromJson(json.decode(str));

class PartnerResponseList {
  PartnerResponseList({required this.result});

  final List<PartnerResponse> result;

  factory PartnerResponseList.fromJson(Map<String, dynamic> json) {
    return PartnerResponseList(
      result: json["result"] == null
          ? []
          : List<PartnerResponse>.from(
              json["result"]!.map((x) => PartnerResponse.fromJson(x))),
    );
  }
}
//? List<Result>

class PartnerResponse {
  PartnerResponse({
    this.prtnerId,
    this.cityId,
    this.age,
    this.gender,
    this.userName,
    this.cityName,
    this.id,
  });

  int? prtnerId = 0;
  int? cityId = 0;
  int? age = 0;
  int? gender = 0;
  String? userName = '';
  String? cityName = '';
  int? id = 0;

  factory PartnerResponse.fromJson(Map<String, dynamic> json) {
    return PartnerResponse(
      prtnerId: json["prtnerId"] ?? 0,
      cityId: json["cityId"] ?? 0,
      age: json["age"] ?? 0,
      gender: json["gender"] ?? 0,
      userName: json["userName"] ?? "",
      cityName: json["cityName"] ?? "",
      id: json["id"] ?? 0,
    );
  }
}
