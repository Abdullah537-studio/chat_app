part of 'chat_dialog_cubit.dart';

class ChatDialogState {
  final String message;
  final CubitStatus status;
  DialogChatResponse? chatDialog;
  ChatDialogState(
      {required this.message, required this.status, this.chatDialog});

  factory ChatDialogState.initial() {
    return ChatDialogState(message: "", status: CubitStatus.initial);
  }
  ChatDialogState copyWith(
      {String? message, CubitStatus? status, DialogChatResponse? chatDialog}) {
    return ChatDialogState(
      message: message ?? this.message,
      status: status ?? this.status,
      chatDialog: chatDialog ?? this.chatDialog,
    );
  }
}
