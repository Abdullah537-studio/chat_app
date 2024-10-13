part of 'search_partner_cubit.dart';

class SearchPartnerState {
  final String message;
  final List<PartnerResponse> partner;
  final CubitStatus status;
  SearchPartnerState(
      {required this.message, required this.status, required this.partner});

  factory SearchPartnerState.initial() {
    List<PartnerResponse> partner = [];
    return SearchPartnerState(
      partner: partner,
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
