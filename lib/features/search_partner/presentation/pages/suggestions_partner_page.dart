import 'package:chat_2/core/enum/tab_bar_state.dart';
import 'package:chat_2/core/feature_button_nav_bar/presentation/bootom_navigation_tab_bar_cubit/bootom_tab_bar_cubit.dart';
import 'package:chat_2/core/strings/image_png.dart';
import 'package:chat_2/features/chat_partner/presentation/cubits/chat_dialog_cubit/chat_dialog_cubit.dart';
import 'package:chat_2/features/chat_partner/presentation/widgets/custom_suggestion_partner_info.dart';
import 'package:chat_2/features/chat_partner/presentation/classes/user_and_partner_info.dart';
import 'package:chat_2/features/search_partner/data/models/response/search_partner_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuggestionPartner extends StatelessWidget {
  const SuggestionPartner({super.key});
  @override
  Widget build(BuildContext context) {
    PartnerResponse partnerResponse = PartnerResponse();

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: UserPartnerInfo.partnerInfo?.length,
      itemBuilder: (context, index) {
        return CutomSuggestionPartnerInfo(
          partnerResponse:
              UserPartnerInfo.partnerInfo?[index] ?? partnerResponse,
          child: Image.asset(AppImageStringPng.imageNotFoundPng),
          ontap: () {
            context
                .read<BootomTabBarCubit>()
                .getIndexTabBar(TabBarStatus.chatBubble);
          },
        );
      },
    );
  }
}
