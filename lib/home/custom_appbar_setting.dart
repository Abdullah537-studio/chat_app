import 'package:chat_2/core/strings/color_manager.dart';
import 'package:chat_2/core/strings/key_translate_manger.dart';
import 'package:chat_2/core/widget/custom_show_dialog_confirm_logout.dart';
import 'package:chat_2/core/widget/main_text_widget.dart';
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
    actions: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: GestureDetector(
          onTap: () {
            showAlertDialogConfirmLogOut(context);
          },
          child: Icon(
            Icons.logout,
            color: IconTheme.of(context).color,
          ),
        ),
      ),
    ],
    backgroundColor: AppColor.kPrimaryColor,
    title: MainTextWidget(
      text: translating(context, AppKeyTranslateManger.setting_mes),
      style: Theme.of(context).textTheme.titleMedium!,
      isCenter: true,
    ),
  );
}
