import 'package:chat_2/core/error/exception.dart';
import 'package:chat_2/core/shared/shared_pref.dart';
import 'package:chat_2/core/strings/error_strings.dart';
import 'package:chat_2/features/chat_partner/data/models/dialog_chat_model/dialog_chat_response.dart';
import 'package:chat_2/features/chat_partner/domain/usecases/get_chat_dialog_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chat_2/core/enum/cubit_enum.dart';

part 'chat_dialog_state.dart';

class ChatDialogCubit extends Cubit<ChatDialogState> {
  final ChatDialogUseCase chatDialogUseCase;
  ChatDialogCubit(this.chatDialogUseCase) : super(ChatDialogState.initial());
  Future<void> getChatDialog() async {
    emit(
      state.copyWith(status: CubitStatus.loading),
    );

    final chatDialogData = await chatDialogUseCase();

    await chatDialogData.fold(
      (failure) {
        try {
          emit(
            state.copyWith(status: CubitStatus.faild, message: failure.error),
          );
        } on ServerException {
          emit(
            state.copyWith(
                status: CubitStatus.faild, message: serverExceptionString),
          );
        }
      },
      (data) {
        if (data.dialogs.isNotEmpty) {
          AppSharedPreferences.cachIdDialogChatBubblePartner(
            id: data.dialogs.first.chatid.toString(),
          );
        }
        emit(
          state.copyWith(
            chatDialog: data,
            status: CubitStatus.done,
          ),
        );
      },
    );
  }
}
