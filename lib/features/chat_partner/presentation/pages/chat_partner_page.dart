import 'package:chat_2/core/enum/tab_bar_state.dart';
import 'package:chat_2/core/feature_button_nav_bar/presentation/bootom_navigation_tab_bar_cubit/bootom_tab_bar_cubit.dart';
import 'package:chat_2/core/enum/cubit_enum.dart';
import 'package:chat_2/core/function/main_functions/cut_string_last_message.dart';
import 'package:chat_2/core/strings/key_translate_manger.dart';
import 'package:chat_2/core/widget/loading_indicator.dart';
import 'package:chat_2/core/widget/show_snack_bar.dart';
import 'package:chat_2/features/chat_partner/presentation/cubits/chat_partner_info_cubit/chat_partner_info_cubit.dart';
import 'package:chat_2/features/chat_partner/presentation/pages/chat_bubble_with_partner_page.dart';
import 'package:chat_2/features/chat_partner/presentation/widgets/custom_partnerInfo_messiging.dart';
import 'package:chat_2/features/chat_partner/presentation/widgets/custom_partner_no_message_yet.dart';
import 'package:chat_2/core/strings/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: AppColor.kPrimaryColor,
      onRefresh: () {
        return context.read<ChatPartnerInfoCubit>().getAllChatPartner();
      },
      child: BlocConsumer<ChatPartnerInfoCubit, ChatPartnerState>(
        listener: (context, state) {
          if (state.status == CubitStatus.faild) {
            showSnackBar(
              context,
              translating(
                context,
                AppKeyTranslateManger.tryAgain,
              ),
            );
          }
        },

//!-----------if state is done {list is empty show no message yet or list have data show it}
        builder: (context, state) {
          if (state.status == CubitStatus.loading) {
            return const loadingIndicator();
          } else if (state.status == CubitStatus.done) {
            if (state.chatPartner == null || state.chatPartner!.isEmpty) {
              return const CustomPartnerNoMessageYet();
            } else {
              return ListView.builder(
                itemCount: state.chatPartner?.length ?? 0,
                itemBuilder: (context, index) {
                  //? ----------------------------- variables ------------------------------------
                  final chat = state.chatPartner!;
                  final String lastMessage = cutStringLastMessage(
                    lastMessage: state.chatPartner![index].lastMessage,
                  );
                  ChatBubblePartnerPage.userName =
                      state.chatPartner?[index].fullName ?? '';
                  //? ----------------------------------------------------------------------------
                  return CustomPartnerInfoMessiging(
                    datelastMessage: chat.last.lastMessageTime.toString(),
                    lastMessage: lastMessage,
                    userName: state.chatPartner![index].fullName,
                    ontap: () {
                      ChatBubblePartnerPage.partnerId = chat.last.contactId;
                      ChatBubblePartnerPage.userId = chat.last.accountId;

                      context
                          .read<BootomTabBarCubit>()
                          .getIndexTabBar(TabBarStatus.chatBubble);
                    },
                  );
                },
              );
            }
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
