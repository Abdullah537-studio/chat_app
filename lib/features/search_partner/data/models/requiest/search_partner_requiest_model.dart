findAPartnerRequiestToJson(PartnerRequiest data) => data.toJson();

class PartnerRequiest {
  int? cityId;
  int? countryId;
  int? gender;
  int? minAge;
  int? maxAge;
  int? skipCount;
  int? maxResultCount;
  PartnerRequiest({
    this.cityId,
    this.countryId,
    this.gender,
    this.minAge,
    this.maxAge,
    this.maxResultCount = 10,
    this.skipCount = 0,
  });
//! replease bettween min age and max age becu them replease from together from api
  Map<String, dynamic> toJson() {
    return {
      "cityId": cityId,
      "countryId": countryId,
      "gender": gender,
      "minAge": minAge,
      "maxAge": maxAge,
      "maxResultCount": maxResultCount,
      "skipCount": skipCount
    };
  }
}
