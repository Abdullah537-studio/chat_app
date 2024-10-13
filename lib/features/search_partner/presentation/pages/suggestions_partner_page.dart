import 'package:chat_2/core/strings/image_png.dart';
import 'package:chat_2/features/chat_partner/presentation/widgets/custom_suggestion_partner_info.dart';
import 'package:chat_2/features/chat_partner/presentation/widgets/save_user_partner_id.dart';
import 'package:chat_2/features/search_partner/data/models/response/search_partner_response_model.dart';
import 'package:flutter/material.dart';

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
        );
      },
    );
  }
}
