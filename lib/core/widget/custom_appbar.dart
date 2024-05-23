import 'package:chat_2/core/strings/color_manager.dart';
import 'package:chat_2/core/strings/key_translate_manger.dart';
import 'package:chat_2/core/strings/route_named_screens_string.dart';
import 'package:chat_2/core/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//!---------------AppBar all pages { Back , Change Theme }
AppBar buildAppBar(
  BuildContext context,
  String text,
  bool pob,
  Function()? onPressed,
) {
  return AppBar(
    actions: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: CustomTextWidget.textTitleSmall(
          translating(context, AppKeyTranslateManger.setting_mes),
          context,
        ),
      ),
      Container(
        color: AppColor.kPrimaryColor,
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(
                context, RouteNamedScreens.settingScreeenSnameRoute);
          },
          child: Icon(
            Icons.settings,
            color: IconTheme.of(context).color,
          ),
        ),
      )
    ],
    leading: pob == true
        ? GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: onPressed,
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: IconTheme.of(context).color,
            ),
          )
        : SizedBox(),
    toolbarHeight: 65,
    shape: ContinuousRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(29.r),
        bottomRight: Radius.circular(29.r),
      ),
    ),
    backgroundColor: AppColor.kPrimaryColor,
    title: CustomTextWidget.textTitleMedium(text, context),
    centerTitle: true,
  );
}
