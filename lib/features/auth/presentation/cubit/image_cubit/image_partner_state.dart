part of 'image_partner_cubit.dart';

class ImagePartnerState {
  final String message;
  final CubitStatus status;
  final String? image;
  const ImagePartnerState({
    required this.message,
    required this.status,
    this.image,
  });
  factory ImagePartnerState.initial() {
    return const ImagePartnerState(message: '', status: CubitStatus.initial);
  }
  ImagePartnerState copyWith(
      {final String? message, final CubitStatus? status, final String? image}) {
    return ImagePartnerState(
      message: message ?? this.message,
      status: status ?? this.status,
      image: image ?? this.image,
    );
  }
}
