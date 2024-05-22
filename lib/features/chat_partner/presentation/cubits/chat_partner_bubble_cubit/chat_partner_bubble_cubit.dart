import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chat_2/core/enum/cubit_enum.dart';

part 'chat_partner_bubble_state.dart';

class ChatPartnerBubbleCubit extends Cubit<ChatPartnerBubbleState> {
  ChatPartnerBubbleCubit() : super(ChatPartnerBubbleState.initial());
}
