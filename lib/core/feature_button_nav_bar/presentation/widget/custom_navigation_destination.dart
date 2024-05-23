// ignore_for_file: deprecated_member_use

import 'package:chat_2/core/strings/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomNavigationDestination extends StatelessWidget {
  const CustomNavigationDestination(
      {super.key,
      required this.text,
      required this.childDisable,
      required this.childenable});
  final String text;
  final String childDisable;
  final String childenable;
  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      icon: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SvgPicture.asset(
            childDisable,
            width: 40.w,
            height: 40.h,
            color: AppColor.kColorBlack,
          ),
          Text(
            text,
            style: TextStyle(
              color: AppColor.kColorBlack,
              fontSize: 20.sp,
            ),
          )
        ],
      ),
      selectedIcon: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SvgPicture.asset(
            childenable,
            width: 40.w,
            height: 40.h,
            color: AppColor.kPrimaryColor,
          ),
          Text(
            text,
            style: TextStyle(
              color: AppColor.kPrimaryColor,
              fontSize: 20.sp,
            ),
          )
        ],
      ),
      label: '',
    );
  }
}
