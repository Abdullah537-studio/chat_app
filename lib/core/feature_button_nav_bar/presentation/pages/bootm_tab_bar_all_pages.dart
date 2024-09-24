// ignore_for_file: deprecated_member_use

import 'package:chat_2/core/enum/tab_bar_state.dart';
import 'package:chat_2/core/feature_button_nav_bar/presentation/bootom_navigation_tab_bar_cubit/bootom_tab_bar_cubit.dart';
import 'package:chat_2/core/feature_button_nav_bar/presentation/widget/custom_navigation)destination_search_icon.dart';
import 'package:chat_2/core/feature_button_nav_bar/presentation/widget/show_app_bar_for_all_pages.dart';
import 'package:chat_2/core/feature_button_nav_bar/presentation/widget/show_body_for_all_pages.dart';
import 'package:chat_2/core/feature_button_nav_bar/presentation/widget/custom_navigation_bar_theme_data.dart';
import 'package:chat_2/core/feature_button_nav_bar/presentation/widget/custom_navigation_destination.dart';
import 'package:chat_2/core/strings/image_svg.dart';
import 'package:chat_2/core/strings/key_translate_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BootomNabigationAllPages extends StatelessWidget {
  BootomNabigationAllPages({super.key});

  @override
  Widget build(BuildContext context) {
    int indexClick = 0;
    return BlocBuilder<BootomTabBarCubit, BootomTabBarState>(
      builder: (context, state) => Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
//!----------------------appBar all pages {with out appBar setting}
        appBar: showAppBarForAllPages(context, indexClick),
//!------------------bootm navigation bar
        bottomNavigationBar: CustomNavigationBarThemeData(
          child: NavigationBar(
            selectedIndex: indexClick,
            height: 120.h,
//!----------------------icons navigation bootom

            destinations: [
              //?---------Home
              CustomNavigationDestination(
                ontap: () {
                  indexClick = 0;
                  bodyTabBardestination = TabBarStatus.home;
                  context.read<BootomTabBarCubit>().getIndexTabBar();
                },
                childDisable: homeIcon,
                childenable: homeIcon,
                text: translating(context, AppKeyTranslateManger.home),
              ),
              //?---------Search
              CustomNavigationSearchIconDestination(
                ontap: () {
                  indexClick = 1;
                  bodyTabBardestination = TabBarStatus.search;
                  context.read<BootomTabBarCubit>().getIndexTabBar();
                },
                childDisable: searchIconDisalbe,
                childenable: searchIconEnable,
                text: "",
              ),
              //?---------Chat
              CustomNavigationDestination(
                ontap: () {
                  indexClick = 2;
                  bodyTabBardestination = TabBarStatus.chatInfo;
                  context.read<BootomTabBarCubit>().getIndexTabBar();
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
      ),
    );
  }
}
