// ignore_for_file: deprecated_member_use

import 'package:chat_2/core/enum/tab_bar_state.dart';
import 'package:chat_2/core/feature_button_nav_bar/presentation/bootom_navigation_tab_bar_cubit/bootom_tab_bar_cubit.dart';
import 'package:chat_2/core/feature_button_nav_bar/presentation/widget/custom_navigation)destination_search_icon.dart';
import 'package:chat_2/core/feature_button_nav_bar/presentation/widget/show_body_for_all_pages.dart';
import 'package:chat_2/core/feature_button_nav_bar/presentation/widget/custom_navigation_bar_theme_data.dart';
import 'package:chat_2/core/feature_button_nav_bar/presentation/widget/custom_navigation_destination.dart';
import 'package:chat_2/core/strings/image_svg.dart';
import 'package:chat_2/core/strings/key_translate_manger.dart';
import 'package:chat_2/core/widget/custom_appbar.dart';
import 'package:chat_2/features/chat_partner/presentation/widgets/save_user_partner_id.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BootomNabigationAllPages extends StatelessWidget {
  BootomNabigationAllPages({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BootomTabBarCubit, BootomTabBarState>(
        builder: (context, state) {
      List appBarStringsScreen = <String>[
        translating(context, AppKeyTranslateManger.home),
        translating(context, AppKeyTranslateManger.findpartner),
        translating(context, AppKeyTranslateManger.message),
        translating(context, AppKeyTranslateManger.suggset),
      ];

      bool IsPob = state.tabBarStatus == TabBarStatus.suggetionPartner ||
              state.tabBarStatus == TabBarStatus.chatBubble
          ? true
          : false;

      return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
//!----------------------appBar all pages {with out appBar setting}
        appBar: buildAppBar(
            context: context,
            text: state.tabBarStatus == TabBarStatus.search
                ? appBarStringsScreen[1]
                : state.tabBarStatus == TabBarStatus.chatInfo
                    ? appBarStringsScreen[2]
                    : state.tabBarStatus == TabBarStatus.suggetionPartner
                        ? appBarStringsScreen[3]
                        : state.tabBarStatus == TabBarStatus.chatBubble
                            ? UserPartnerInfo.userName
                            : appBarStringsScreen[0],
            pob: IsPob,
            onPressed: () {
              if (state.tabBarStatus == TabBarStatus.chatBubble) {
                context
                    .read<BootomTabBarCubit>()
                    .getIndexTabBar(TabBarStatus.chatInfo);
              } else if (state.tabBarStatus == TabBarStatus.suggetionPartner) {
                context
                    .read<BootomTabBarCubit>()
                    .getIndexTabBar(TabBarStatus.search);
              } else {
                return buildAppBar(
                  context: context,
                  text: appBarStringsScreen[state.index ?? 0],
                  pob: false,
                  onPressed: () {},
                );
              }
            }),
//!------------------bootm navigation bar
        bottomNavigationBar: CustomNavigationBarThemeData(
          child: NavigationBar(
            selectedIndex: state.index ?? 0,
            height: 120.h,
//!----------------------icons navigation bootom

            destinations: [
              //?---------Home
              CustomNavigationDestination(
                ontap: () {
                  context
                      .read<BootomTabBarCubit>()
                      .getIndexTabBar(TabBarStatus.home);
                },
                childDisable: homeIcon,
                childenable: homeIcon,
                text: translating(context, AppKeyTranslateManger.home),
              ),
              //?---------Search
              CustomNavigationSearchIconDestination(
                ontap: () {
                  context
                      .read<BootomTabBarCubit>()
                      .getIndexTabBar(TabBarStatus.search);
                },
                childDisable: searchIconDisalbe,
                childenable: searchIconEnable,
                text: "",
              ),
              //?---------Chat
              CustomNavigationDestination(
                ontap: () {
                  context
                      .read<BootomTabBarCubit>()
                      .getIndexTabBar(TabBarStatus.chatInfo);
                },
                childDisable: chatIcon,
                childenable: chatIcon,
                text: translating(context, AppKeyTranslateManger.message),
              ),
            ],
          ),
        ),
//!----------------------------show body as enum shown
        body: ShowBodyTabBarPages(),
      );
    });
  }
}
