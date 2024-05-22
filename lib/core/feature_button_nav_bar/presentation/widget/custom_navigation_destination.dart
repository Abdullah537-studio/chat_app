// ignore_for_file: deprecated_member_use

import 'package:chat_2/core/strings/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomNavigationDestination extends StatelessWidget {
  const CustomNavigationDestination(
      {super.key,
      required this.text,
      required this.childDisable,
      required this.childenable});
  final String text;
  final Widget childDisable;
  final Widget childenable;
  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      icon: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          childDisable,
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
          childenable,
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
