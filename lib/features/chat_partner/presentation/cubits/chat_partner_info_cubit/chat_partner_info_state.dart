part of 'chat_partner_info_cubit.dart';

class ChatPartnerState {
  final String message;
  final CubitStatus status;
  List<ChatPartnerModel>? chatPartner;
  ChatPartnerState({
    this.chatPartner,
    required this.message,
    required this.status,
  });

  factory ChatPartnerState.initial() {
    return ChatPartnerState(message: "", status: CubitStatus.initial);
  }

  ChatPartnerState copyWith(
      {String? message,
      CubitStatus? status,
      List<ChatPartnerModel>? chatPartner}) {
    return ChatPartnerState(
      message: message ?? this.message,
      status: status ?? this.status,
      chatPartner: chatPartner ?? this.chatPartner,
    );
  }
}
