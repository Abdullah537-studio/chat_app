import 'package:chat_2/core/enum/cubit_enum.dart';
import 'package:chat_2/core/function/main_functions/convert_base64_to_image_partner_from_api.dart';
import 'package:chat_2/core/strings/image_png.dart';
import 'package:chat_2/features/auth/presentation/cubit/image_cubit/image_partner_cubit.dart';
import 'package:chat_2/features/chat_partner/presentation/pages/chat_bubble_with_partner_page.dart';
import 'package:chat_2/features/chat_partner/presentation/widgets/custom_suggestion_partner_info.dart';
import 'package:chat_2/features/chat_partner/presentation/widgets/save_user_partner_id.dart';

import 'package:chat_2/features/search_partner/data/models/response/search_partner_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuggestionPartner extends StatelessWidget {
  const SuggestionPartner({super.key});
  static List<PartnerResponse>? partnerInfo;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: partnerInfo?.length,
      itemBuilder: (context, index) {
        UserPartnerInfo.userName = partnerInfo?[index].userName ?? '';
        UserPartnerInfo.userId = partnerInfo?[index].prtnerId ?? 0;
        UserPartnerInfo.partnerId = partnerInfo?[index].id ?? 0;

        return CutomSuggestionPartnerInfo(
          id: partnerInfo?[index].id ?? 0,
          name: partnerInfo?[index].userName ?? "",
          age: partnerInfo?[index].age.toString() ?? '',
          cityName: partnerInfo?[index].cityName ?? "",
          child: Image.asset(AppImageStringPng.imageNotFoundPng),
        );
      },
    );
  }
}
