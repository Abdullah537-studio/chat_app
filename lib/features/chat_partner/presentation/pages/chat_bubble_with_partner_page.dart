import 'package:chat_2/core/enum/cubit_enum.dart';
import 'package:chat_2/core/shared/shared_pref.dart';
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
import 'package:chat_2/features/chat_partner/presentation/classes/user_and_partner_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatBubblePartnerPage extends StatelessWidget {
  const ChatBubblePartnerPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    ChatBubbleRequiest chatBubbleRequiest = ChatBubbleRequiest(
      who: UserPartnerInfo.userId,
      recipientId: UserPartnerInfo.partnerId,
      time: DateTime.now(),
    );

    void _sendMessage() {
      chatBubbleRequiest.time = DateTime.now();

      context.read<ChatPartnerBubbleCubit>().chatBubble(chatBubbleRequiest);

      String dialog = AppSharedPreferences.dialogChatBubblePartnerById();
      if (dialog.isNotEmpty) {
        context.read<ChatDialogCubit>().getChatDialog();
      }
      controller.clear();
    }

    return BlocConsumer<ChatDialogCubit, ChatDialogState>(
      listener: (context, state) {
        if (state.status == CubitStatus.faild) {
          return showSnackBarMain(
            context,
            translating(
              context,
              AppKeyTranslateManger.tryAgain,
            ),
          );
        }
      },
      builder: (context, state) {
        if (state.status == CubitStatus.loading) {
          return const loadingIndicator();
        } else if (state.status == CubitStatus.done) {
          return RefreshIndicator(
            color: AppColor.kPrimaryColor,
            onRefresh: () {
              return context.read<ChatDialogCubit>().getChatDialog();
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 20.h),
              child: Column(
                children: [
                  //? ----------------------------- All messages ---------------------------------
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        if (state.chatDialog?.dialogs[index].who ==
                            UserPartnerInfo.userId) {
                          return CustomChatBubleUser(
                            text: state.chatDialog!.dialogs[index].message,
                          );
                        } else {
                          return CustomChatBublePartner(
                            text: state.chatDialog!.dialogs[index].message,
                          );
                        }
                      },
                      itemCount: state.chatDialog?.dialogs.length ?? 0,
                    ),
                  ),
                  //?------------------------------Box Send Message ------------------------------
                  CustomBoxSendMessage(
                    onChangeTextFormField: (val) {
                      chatBubbleRequiest.message = val;
                    },
                    onPressedIconSendMessage: _sendMessage,
                  ),
                ],
              ),
            ),
          );
        } else {
          return Align(
            alignment: Alignment.bottomCenter,
            child: RefreshIndicator(
              color: AppColor.kPrimaryColor,
              onRefresh: () {
                String dialog =
                    AppSharedPreferences.dialogChatBubblePartnerById();
                if (dialog.isNotEmpty) {
                  return context.read<ChatDialogCubit>().getChatDialog();
                } else {
                  Future empty = Future(() => null);
                  return empty;
                }
              },
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                children: [
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height / 2,
                  ),
                  CustomBoxSendMessage(
                    controller: controller,
                    onChangeTextFormField: (val) {
                      chatBubbleRequiest.message = val;
                    },
                    onPressedIconSendMessage: _sendMessage,
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
