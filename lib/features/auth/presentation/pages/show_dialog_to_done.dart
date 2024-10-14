import '../../../../../generate/app_localizations/app_localizations.dart';
import 'package:chat_2/core/strings/color_manager.dart';
import 'package:chat_2/core/strings/key_translate_manger.dart';
import 'package:chat_2/core/strings/route_named_screens_string.dart';
import 'package:chat_2/core/widget/custom_button.dart';
import 'package:chat_2/core/widget/main_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginToContainue extends StatelessWidget {
  const LoginToContainue({super.key});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.8,
      child: Container(
        padding: EdgeInsets.all(12.dg),
        color: AppColor.kColorWhite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MainTextWidget(
              text: translating(
                context,
                AppKeyTranslateManger.singup,
              ),
              style: Theme.of(context).textTheme.bodyMedium,
              isCenter: true,
            ),
            MainTextWidget(
              text: translating(context,
                  AppKeyTranslateManger.please_login_to_continue_1_dialog),
              style: Theme.of(context).textTheme.bodyMedium,
              isCenter: true,
            ),
            MainTextWidget(
              text: translating(context,
                  AppKeyTranslateManger.please_login_to_continue_2_dialog),
              style: Theme.of(context).textTheme.bodyMedium,
              isCenter: true,
            ),
            Padding(
              padding: EdgeInsets.only(top: 25.h),
              child: MainButton(
                backgroundColor: AppColor.kPrimaryColor,
                borderColor: AppColor.kColorWhite,
                text: translating(context, AppKeyTranslateManger.done_dialog),
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, RouteNamedScreens.loginScreenNameRoute);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
