import 'package:chat_2/core/enum/tab_bar_state.dart';
import 'package:chat_2/core/feature_button_nav_bar/presentation/bootom_navigation_tab_bar_cubit/bootom_tab_bar_cubit.dart';
import 'package:chat_2/core/strings/key_translate_manger.dart';
import 'package:chat_2/core/widget/custom_appbar.dart';
import 'package:chat_2/features/chat_partner/presentation/pages/chat_bubble_with_partner_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

AppBar showAppBarForAllPages(BuildContext context, int index) {
  List appBarStringsScreen = <String>[
    translating(context, AppKeyTranslateManger.home),
    translating(context, AppKeyTranslateManger.findpartner),
    translating(context, AppKeyTranslateManger.message),
  ];

  return
      //! suggestion partner
      bodyTabBardestination == TabBarStatus.suggetionPartner
          ? buildAppBar(
              context,
              translating(context, AppKeyTranslateManger.suggset),
              true,
              () {
                bodyTabBardestination = TabBarStatus.search;
                context.read<BootomTabBarCubit>().getIndexTabBar();
              },
            )
//! chatbubble
          : bodyTabBardestination == TabBarStatus.chatBubble
              ? buildAppBar(
                  context,
                  ChatBubblePartnerPage.userName,
                  true,
                  () {
                    bodyTabBardestination = TabBarStatus.chatInfo;
                    context.read<BootomTabBarCubit>().getIndexTabBar();
                  },
                )
//! from index  get title appbar { list appBarStringsScreen }
              : buildAppBar(
                  context,
                  appBarStringsScreen[index],
                  false,
                  () {},
                );
}
