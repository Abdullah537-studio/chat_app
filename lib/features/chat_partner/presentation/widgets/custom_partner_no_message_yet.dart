import 'package:chat_2/core/widget/main_text_widget.dart';

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
            MainTextWidget(
              text: translating(context, AppKeyTranslateManger.noMessageTop),
              style: Theme.of(context).textTheme.bodyLarge!,
              isCenter: false,
            ),
            MainTextWidget(
              text: translating(context, AppKeyTranslateManger.noMessagebottom),
              style: Theme.of(context).textTheme.bodyLarge!,
              isCenter: false,
            ),
          ],
        ),
      ),
    );
  }
}
