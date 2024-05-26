import 'package:chat_2/core/strings/color_manager.dart';
import 'package:chat_2/core/strings/image_png.dart';
import 'package:chat_2/core/strings/key_translate_manger.dart';
import 'package:chat_2/core/strings/route_named_screens_string.dart';
import 'package:chat_2/core/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginOrSignupPage extends StatelessWidget {
  const LoginOrSignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: AppColor.kSecondaryColor,
          image: DecorationImage(
            image: AssetImage(AppImageStringPng.backgroundLoginOrSignIn),
            fit: BoxFit.fill,
          ),
        ),
        child: Align(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                translating(context, AppKeyTranslateManger.login_to_containue),
                style: TextStyle(fontSize: 20.sp, color: AppColor.kColorBlack),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: MainButton(
                  backgroundColor: AppColor.kColorWhite,
                  borderColor: AppColor.kPrimaryColor,
                  text: translating(context, AppKeyTranslateManger.login),
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, RouteNamedScreens.loginScreenNameRoute);
                  },
                ),
              ),
              //? Main Button For
              MainButton(
                backgroundColor: AppColor.kPrimaryColor,
                borderColor: AppColor.kSecondaryColor,
                text: translating(context, AppKeyTranslateManger.singup),
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, RouteNamedScreens.signinScreenNameRoute);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
