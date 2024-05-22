part of 'chat_partner_bubble_cubit.dart';

class ChatPartnerBubbleState {
  final CubitStatus status;
  final String message;
  const ChatPartnerBubbleState({required this.status, required this.message});
  factory ChatPartnerBubbleState.initial() {
    return const ChatPartnerBubbleState(
        status: CubitStatus.initial, message: '');
  }
  ChatPartnerBubbleState copyWith({String? message, CubitStatus? status}) {
    return ChatPartnerBubbleState(
        status: status ?? this.status, message: message ?? this.message);
  }
}
