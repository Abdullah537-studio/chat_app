import 'package:chat_2/core/strings/key_translate_manger.dart';
import 'package:chat_2/core/widget/custom_dropdown_translate_appbar.dart';
import 'package:chat_2/core/widget/main_text_widget.dart';
import 'package:chat_2/core/widget/leading_app_change_theme.dart';
import 'package:chat_2/home/custom_appbar_setting.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).hoverColor,
      appBar: buildAppBarSetting(context),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MainTextWidget(
                text: translating(
                  context,
                  AppKeyTranslateManger.change_theme_setting,
                ),
                style: Theme.of(context).textTheme.bodyMedium!,
                isCenter: false,
              ),
              LeadingChangeTheme()
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MainTextWidget(
                text: translating(
                  context,
                  AppKeyTranslateManger.change_languange_setting,
                ),
                style: Theme.of(context).textTheme.bodyMedium!,
                isCenter: false,
              ),
              CustomDropdownTranslateAppBar()
            ],
          ),
        ],
      ),
    );
  }
}
