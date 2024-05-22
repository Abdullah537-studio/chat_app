import 'package:chat_2/core/enum/cubit_enum.dart';
import 'package:chat_2/core/strings/color_manager.dart';
import 'package:chat_2/core/strings/key_translate_manger.dart';
import 'package:chat_2/core/widget/loading_indicator.dart';
import 'package:chat_2/core/widget/show_snack_bar.dart';
import 'package:chat_2/features/chat_partner/data/models/chat_bubble_model/chat_bubble_requiest.dart';
import 'package:chat_2/features/chat_partner/presentation/cubits/chat_dialog_cubit/chat_dialog_cubit.dart';
import 'package:chat_2/features/chat_partner/presentation/cubits/chat_partner_cubit/chat_partner_bubble_cubit.dart';
import 'package:chat_2/features/chat_partner/presentation/widgets/custom_box_send_message.dart';
import 'package:chat_2/features/chat_partner/presentation/widgets/custom_chat_bubble_partner.dart';
import 'package:chat_2/features/chat_partner/presentation/widgets/custom_chat_bubble_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatBubblePartnerPage extends StatelessWidget {
  static int partnerId = 0;
  static String userName = '';
  static int userId = 0;

  const ChatBubblePartnerPage({
    super.key,
    //  required this.data,
  });
  // final Map<String, int> data;

  @override
  Widget build(BuildContext context) {
    ChatBubbleRequiest chatBubbleRequiest = ChatBubbleRequiest();
    chatBubbleRequiest.who = userId;
    chatBubbleRequiest.recipientId = partnerId;
    chatBubbleRequiest.time = DateTime.now();

    return BlocConsumer<ChatDialogCubit, ChatDialogState>(
      listener: (context, state) {
        if (state.status == CubitStatus.faild) {
          return showSnackBar(
            context,
            translating(
              context,
              AppKeyTranslateManger.tryAgain,
            ),
          );
        }
      },
      builder: (context, state) {
        if (state.status == CubitStatus.done) {
          return RefreshIndicator(
            color: AppColor.kPrimaryColor,
            onRefresh: () {
              return context.read<ChatDialogCubit>().getChatDialog();
            },
            child: Padding(
              padding: EdgeInsets.only(
                right: 28.w,
                left: 28.w,
                bottom: 10.h,
                top: 28.h,
              ),
              child: Column(
                children: [
                  //? ----------------------------- All messages ---------------------------------
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return state.chatDialog!.dialogs[index].who == userId
                            ? CustomChatBubleUser(
                                text: state.chatDialog!.dialogs[index].message)
                            : CustomChatBublePartner(
                                text: state.chatDialog!.dialogs[index].message,
                              );
                      },
                      itemCount: state.chatDialog!.dialogs.length,
                    ),
                  ),
                  //?------------------------------Box Send Message ------------------------------
                  CustomBoxSendMessage(
                    // controller: controller,
                    onChangeTextFormField: (val) {
                      chatBubbleRequiest.message = val;
                    },
                    onPressedIconSendMessage: () {
                      context
                          .read<ChatPartnerBubbleCubit>()
                          .chatBubble(chatBubbleRequiest);

                      context.read<ChatDialogCubit>().getChatDialog();
                      // controller.clear();
                    },
                  ),
                ],
              ),
            ),
          );
        } else if (state.status == CubitStatus.loading) {
          return const loadingIndicator();
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
