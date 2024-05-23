import 'package:chat_2/core/enum/tab_bar_state.dart';
import 'package:chat_2/features/chat_partner/presentation/pages/chat_bubble_with_partner_page.dart';
import 'package:chat_2/features/chat_partner/presentation/pages/chat_partner_page.dart';
import 'package:chat_2/features/search_partner/presentation/pages/find_a_partner_page.dart';
import 'package:chat_2/features/search_partner/presentation/pages/suggestions_partner_page.dart';
import 'package:chat_2/home/home_body.dart';
import 'package:flutter/material.dart';

class ShowBodyTabBarPages extends StatelessWidget {
  const ShowBodyTabBarPages({super.key});

  @override
  Widget build(BuildContext context) {
    return bodyTabBardestination == TabBarStatus.search
        ? FindAPartnerPage()
        : bodyTabBardestination == TabBarStatus.chatInfo
            ? const ChatPage()
            : bodyTabBardestination == TabBarStatus.chatBubble
                ? const ChatBubblePartnerPage()
                : bodyTabBardestination == TabBarStatus.suggetionPartner
                    ? SuggestionPartner()
                    : const HomePage();
  }
}
