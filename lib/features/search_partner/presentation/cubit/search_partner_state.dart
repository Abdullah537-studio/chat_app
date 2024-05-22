part of 'search_partner_cubit.dart';

class SearchPartnerState {
  final String message;
  List<PartnerResponse>? partner = [];
  final CubitStatus status;
  SearchPartnerState(
      {required this.message, required this.status, this.partner});

  factory SearchPartnerState.initial() {
    return SearchPartnerState(
      message: '',
      status: CubitStatus.initial,
    );
  }

  SearchPartnerState copyWith({
    CubitStatus? status,
    String? message,
    List<PartnerResponse>? partner,
  }) {
    return SearchPartnerState(
        message: message ?? this.message,
        status: status ?? this.status,
        partner: partner ?? this.partner);
  }
}
