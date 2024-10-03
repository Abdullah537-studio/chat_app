import 'package:chat_2/core/enum/tab_bar_state.dart';
import 'package:chat_2/core/feature_button_nav_bar/presentation/bootom_navigation_tab_bar_cubit/bootom_tab_bar_cubit.dart';
import 'package:chat_2/features/chat_partner/presentation/pages/chat_bubble_with_partner_page.dart';
import 'package:chat_2/features/chat_partner/presentation/pages/chat_partner_page.dart';
import 'package:chat_2/features/search_partner/presentation/pages/find_a_partner_page.dart';
import 'package:chat_2/features/search_partner/presentation/pages/suggestions_partner_page.dart';
import 'package:chat_2/home/home_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowBodyTabBarPages extends StatelessWidget {
  const ShowBodyTabBarPages({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BootomTabBarCubit, BootomTabBarState>(
      builder: (context, state) {
        if (state.tabBarStatus == TabBarStatus.search) {
          return FindAPartnerPage();
        } else if (state.tabBarStatus == TabBarStatus.chatInfo) {
          return ChatPage();
        } else if (state.tabBarStatus == TabBarStatus.chatBubble) {
          return ChatBubblePartnerPage();
        } else if (state.tabBarStatus == TabBarStatus.suggetionPartner) {
          return SuggestionPartner();
        } else {
          return const HomePage();
        }
      },
    );
  }
}
