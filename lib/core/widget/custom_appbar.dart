import 'package:chat_2/core/strings/color_manager.dart';
import 'package:chat_2/core/strings/route_named_screens_string.dart';
import 'package:chat_2/core/widget/main_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppBar({
  required BuildContext context,
  required String text,
  required bool pob,
  Function()? onPressed,
}) {
  return AppBar(
    actions: [
      Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
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
    title: MainTextWidget(
      text: text,
      style: Theme.of(context).textTheme.titleMedium!,
      isCenter: true,
    ),
  );
}
