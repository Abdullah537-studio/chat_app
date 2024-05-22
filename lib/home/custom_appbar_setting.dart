import 'package:chat_2/core/strings/color_manager.dart';
import 'package:chat_2/core/strings/key_translate_manger.dart';
import 'package:chat_2/core/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppBarSetting(BuildContext context) {
  return AppBar(
    leading: GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        Navigator.pop(context);
      },
      child: Icon(
        Icons.arrow_back_ios_new_rounded,
        color: IconTheme.of(context).color,
      ),
    ),
    shape: ContinuousRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(29.r),
        bottomRight: Radius.circular(29.r),
      ),
    ),
    backgroundColor: AppColor.kPrimaryColor,
    title: CustomTextWidget.textTitleMedium(
        translating(context, AppKeyTranslateManger.setting_mes), context),
    centerTitle: true,
  );
}
