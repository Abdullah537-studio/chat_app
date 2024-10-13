import 'package:chat_2/core/strings/color_manager.dart';
import 'package:chat_2/core/strings/key_translate_manger.dart';
import 'package:chat_2/features/auth/presentation/widgets/custom_text_underline.dart';
import 'package:flutter/material.dart';

class AcceptTheTermsAndServices extends StatefulWidget {
  AcceptTheTermsAndServices({super.key});

  @override
  State<AcceptTheTermsAndServices> createState() =>
      _AcceptTheTermsAndServicesState();
}

bool isSelected = false;

class _AcceptTheTermsAndServicesState extends State<AcceptTheTermsAndServices> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isSelected,
          activeColor: AppColor.kPrimaryColor,
          onChanged: (value) {
            setState(
              () {
                isSelected = value ?? false;
              },
            );
          },
        ),
        CustomtextUnderLine(
          color: isSelected ? AppColor.kPrimaryColor : AppColor.kColorBlack,
          text: translating(context, AppKeyTranslateManger.accept_Qu),
          textPressed:
              translating(context, AppKeyTranslateManger.accept_system),
        ),
      ],
    );
  }
}
