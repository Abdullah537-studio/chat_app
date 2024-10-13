part of 'chat_partner_bubble_cubit.dart';

class ChatPartnerBubbleState {
  final String message;
  final CubitStatus status;
  ChatPartnerBubbleState({
    required this.message,
    required this.status,
  });
  factory ChatPartnerBubbleState.initial() {
    return ChatPartnerBubbleState(
      message: "",
      status: CubitStatus.initial,
    );
  }

  ChatPartnerBubbleState copyWith(
      {String? message,
      CubitStatus? status,
      ChatBubbleResponse? chatBubbleResponse}) {
    return ChatPartnerBubbleState(
      message: message ?? this.message,
      status: status ?? this.status,
    );
  }
}
