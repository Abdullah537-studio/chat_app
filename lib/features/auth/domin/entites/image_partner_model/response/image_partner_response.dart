// ImagePartnerResponse imagePartnerResponseFromJson(String str) =>
//     ImagePartnerResponse.fromJson(json.decode(str));

class ImagePartnerResponse {
  final String imagePartner;

  const ImagePartnerResponse({required this.imagePartner});

  factory ImagePartnerResponse.fromJson(Map<String, dynamic> json) {
    return ImagePartnerResponse(imagePartner: json["imagePartner"] ?? '');
  }
}
