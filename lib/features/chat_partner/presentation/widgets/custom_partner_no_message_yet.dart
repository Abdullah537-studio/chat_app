import 'package:chat_2/core/widget/custom_text.dart';

import 'package:chat_2/core/strings/key_translate_manger.dart';
import 'package:flutter/material.dart';

class CustomPartnerNoMessageYet extends StatelessWidget {
  const CustomPartnerNoMessageYet({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Align(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextWidget.textBodyLarge(
              translating(context, AppKeyTranslateManger.noMessageTop),
              context,
            ),
            CustomTextWidget.textBodyLarge(
              translating(context, AppKeyTranslateManger.noMessagebottom),
              context,
            ),
          ],
        ),
      ),
    );
  }
}
