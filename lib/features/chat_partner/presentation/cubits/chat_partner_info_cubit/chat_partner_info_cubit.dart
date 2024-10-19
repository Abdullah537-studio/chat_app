import 'package:chat_2/core/shared/shared_pref.dart';
import 'package:chat_2/features/chat_partner/data/models/chat_info_model/chat_partner_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chat_2/core/enum/cubit_enum.dart';
import '../../../domain/usecases/get_chat_info_usecase.dart';
part 'chat_partner_info_state.dart';

class ChatPartnerInfoCubit extends Cubit<ChatPartnerState> {
  final GetAllChatPartnerUseCase chatPartnerUseCase;
  ChatPartnerInfoCubit(this.chatPartnerUseCase)
      : super(ChatPartnerState.initial());
  getAllChatPartner() async {
    emit(state.copyWith(status: CubitStatus.loading));
    var chatPartnerData = await chatPartnerUseCase();
    chatPartnerData.fold((failure) {
      try {
        emit(state.copyWith(status: CubitStatus.faild, message: failure.error));
      } catch (e) {
        emit(state.copyWith(status: CubitStatus.faild, message: e.toString()));
      }
    }, (data) {
      //! cache id to get dialog messages
      if (data.isNotEmpty) {
        AppSharedPreferences.cachIdDialogChatBubblePartner(
            id: data.first.dialogs.first.chatid);
      }
      emit(state.copyWith(status: CubitStatus.done, chatPartner: data));
    });
  }
}
