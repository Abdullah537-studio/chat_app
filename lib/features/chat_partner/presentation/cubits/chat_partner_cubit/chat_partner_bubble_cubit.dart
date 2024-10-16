import 'package:chat_2/core/enum/cubit_enum.dart';
import 'package:chat_2/core/error/exception.dart';
import 'package:chat_2/core/strings/error_strings.dart';
import 'package:chat_2/features/chat_partner/data/models/chat_bubble_model/chat_bubble_requiest.dart';
import 'package:chat_2/features/chat_partner/data/models/chat_bubble_model/chat_bubble_response.dart';
import 'package:chat_2/features/chat_partner/domain/usecases/get_chat_bubble_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'chat_partner_bubble_state.dart';

class ChatPartnerBubbleCubit extends Cubit<ChatPartnerBubbleState> {
  final ChatBubbleUseCases chatBubbleUseCase;
  ChatPartnerBubbleCubit(this.chatBubbleUseCase)
      : super(ChatPartnerBubbleState.initial());
  Future<void> chatBubble(ChatBubbleRequiest chatBubbleRequiest) async {
    emit(state.copyWith(status: CubitStatus.loading));
    final chatBubbleData =
        await chatBubbleUseCase(chatBubleRequiest: chatBubbleRequiest);
    chatBubbleData.fold((failure) {
      try {
        emit(state.copyWith(
          status: CubitStatus.faild,
          message: failure.error,
        ));
      } on ServerException {
        emit(state.copyWith(
          status: CubitStatus.faild,
          message: serverExceptionString,
        ));
      }
    }, (data) {
      emit(state.copyWith(
          chatBubbleResponse: data, status: CubitStatus.done, message: "done"));
    });
  }
}
