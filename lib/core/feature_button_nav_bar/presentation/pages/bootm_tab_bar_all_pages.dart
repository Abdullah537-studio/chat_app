// ignore_for_file: deprecated_member_use, must_be_immutable

import 'package:chat_2/core/enum/tab_bar_state.dart';
import 'package:chat_2/core/feature_button_nav_bar/presentation/bootom_navigation_tab_bar_cubit/bootom_tab_bar_cubit.dart';
import 'package:chat_2/home/home_body.dart';
import 'package:chat_2/core/feature_button_nav_bar/presentation/widget/custom_navigation_bar_theme_data.dart';
import 'package:chat_2/core/feature_button_nav_bar/presentation/widget/custom_navigation_destination.dart';
import 'package:chat_2/core/strings/color_manager.dart';
import 'package:chat_2/core/strings/image_svg.dart';
import 'package:chat_2/core/strings/key_translate_manger.dart';
import 'package:chat_2/core/widget/custom_appbar.dart';
import 'package:chat_2/features/chat_partner/presentation/pages/chat_bubble_with_partner_page.dart';
import 'package:chat_2/features/chat_partner/presentation/pages/chat_partner_page.dart';
import 'package:chat_2/features/search_partner/data/models/requiest/search_partner_requiest_model.dart';
import 'package:chat_2/features/search_partner/presentation/pages/find_a_partner_page.dart';
import 'package:chat_2/features/search_partner/presentation/pages/suggestions_partner_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BootomNabigationAllPages extends StatelessWidget {
  BootomNabigationAllPages({super.key});

  PartnerRequiest partnerRequiest = PartnerRequiest();
  final GlobalKey<FormState> formState = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final appBarStringsScreen = <String>[
      translating(context, AppKeyTranslateManger.home),
      translating(context, AppKeyTranslateManger.findpartner),
      translating(context, AppKeyTranslateManger.message),
    ];
    return BlocBuilder<BootomTabBarCubit, BootomTabBarState>(
      builder: (context, state) => Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
//!----------------------appBar
        appBar: bodyTabBardestination == TabBarStatus.suggetionPartner
            ? buildAppBar(
                context,
                translating(context, AppKeyTranslateManger.suggset),
                true,
                () {
                  bodyTabBardestination = TabBarStatus.search;
                  context.read<BootomTabBarCubit>().getIndexTabBar();
                },
              )
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
                : buildAppBar(
                    context,
                    appBarStringsScreen[state.index ?? 0],
                    false,
                    () {},
                  ),
//!------------------bootm navigation bar
        bottomNavigationBar: CustomNavigationBarThemeData(
          child: NavigationBar(
            selectedIndex: state.index ?? 0,
            height: 120.h,
            onDestinationSelected: (index) {
              state.index = index;
              if (state.index == 0) {
                bodyTabBardestination = TabBarStatus.home;
              } else if (state.index == 1) {
                bodyTabBardestination = TabBarStatus.search;
              } else if (state.index == 2) {
                bodyTabBardestination = TabBarStatus.chatInfo;
              }
              state.tabBarStatus = bodyTabBardestination;

              context.read<BootomTabBarCubit>().getIndexTabBar();
            },
//!----------------------icons navigation bootom
            destinations: [
              //?---------Home
              CustomNavigationDestination(
                  childDisable: SvgPicture.asset(
                    homeIcon,
                    color: AppColor.kColorBlack,
                    width: 40.w,
                    height: 40.h,
                  ),
                  childenable: SvgPicture.asset(
                    homeIcon,
                    color: AppColor.kPrimaryColor,
                    width: 40.w,
                    height: 40.h,
                  ),
                  text: translating(context, AppKeyTranslateManger.home)),
              //?---------Search
              CustomNavigationDestination(
                childDisable: CircleAvatar(
                  maxRadius: 35.r,
                  backgroundColor: AppColor.kColorBlack,
                  child: SvgPicture.asset(
                    searchIcon,
                    width: 40.w,
                    height: 40.h,
                  ),
                ),
                childenable: CircleAvatar(
                  maxRadius: 35.r,
                  backgroundColor: AppColor.kPrimaryColor,
                  child: SvgPicture.asset(
                    searchIcon,
                    width: 40.w,
                    height: 40.h,
                  ),
                ),
                text: "",
              ),
              //?---------Chat
              CustomNavigationDestination(
                  childDisable: SvgPicture.asset(
                    width: 40.w,
                    height: 40.h,
                    chatIcon,
                    color: AppColor.kColorBlack,
                  ),
                  childenable: SvgPicture.asset(
                    width: 40.w,
                    height: 40.h,
                    chatIcon,
                    color: AppColor.kPrimaryColor,
                  ),
                  text: translating(context, AppKeyTranslateManger.message)),
            ],
          ),
        ),
//!----------------------------body
        body: bodyTabBardestination == TabBarStatus.search
            ? FindAPartnerPage()
            : bodyTabBardestination == TabBarStatus.chatInfo
                ? const ChatPage()
                : bodyTabBardestination == TabBarStatus.chatBubble
                    ? const ChatBubblePartnerPage()
                    : bodyTabBardestination == TabBarStatus.suggetionPartner
                        ? SuggestionPartner()
                        : const HomePage(),
      ),
    );
  }
}
