import 'package:chat_2/core/enum/tab_bar_state.dart';
import 'package:chat_2/core/feature_button_nav_bar/presentation/bootom_navigation_tab_bar_cubit/bootom_tab_bar_cubit.dart';
import 'package:chat_2/core/enum/cubit_enum.dart';
import 'package:chat_2/core/strings/key_translate_manger.dart';
import 'package:chat_2/core/widget/loading_indicator.dart';
import 'package:chat_2/core/widget/main_text_widget.dart';
import 'package:chat_2/core/widget/show_snack_bar.dart';
import 'package:chat_2/features/chat_partner/presentation/classes/user_and_partner_info.dart';
import 'package:chat_2/features/chat_partner/presentation/cubits/chat_dialog_cubit/chat_dialog_cubit.dart';
import 'package:chat_2/features/chat_partner/presentation/cubits/chat_partner_info_cubit/chat_partner_info_cubit.dart';
import 'package:chat_2/features/chat_partner/presentation/widgets/custom_partnerInfo_messiging.dart';
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
            showSnackBarMain(
              context,
              translating(context, AppKeyTranslateManger.tryAgain),
            );
          }
        },

//!-----------if state is done {list is empty show no message yet or list have data show it}
        builder: (context, state) {
          if (state.status == CubitStatus.loading) {
            return const loadingIndicator();
          } else if (state.status == CubitStatus.done) {
            if (state.chatPartner?.isNotEmpty ?? false) {
              UserPartnerInfo.userName =
                  state.chatPartner?.first.fullName ?? "";
              UserPartnerInfo.partnerId =
                  state.chatPartner?.first.contactId ?? 0;
              UserPartnerInfo.userId = state.chatPartner?.first.accountId ?? 0;
              return ListView.builder(
                itemCount: state.chatPartner?.length ?? 0,
                itemBuilder: (context, index) {
                  return CustomPartnerInfoMessiging(
                    chatPartnerModel: state.chatPartner![index],
                    ontap: () {
                      context.read<ChatDialogCubit>().getChatDialog();

                      context
                          .read<BootomTabBarCubit>()
                          .getIndexTabBar(TabBarStatus.chatBubble);
                    },
                  );
                },
              );
            } else {
              return SizedBox(
                child: ListView(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 4),
                  children: [
                    MainTextWidget(
                      text: translating(
                          context, AppKeyTranslateManger.noMessageTop),
                      style: Theme.of(context).textTheme.bodyLarge!,
                      isCenter: true,
                    ),
                    MainTextWidget(
                      text: translating(
                          context, AppKeyTranslateManger.noMessagebottom),
                      style: Theme.of(context).textTheme.bodyLarge!,
                      isCenter: true,
                    ),
                  ],
                ),
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
