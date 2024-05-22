import 'package:chat_2/core/strings/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomNavigationBarThemeData extends StatelessWidget {
  const CustomNavigationBarThemeData({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return NavigationBarTheme(
      data: NavigationBarThemeData(
        surfaceTintColor: AppColor.kColorTransparent,
        backgroundColor: AppColor.kColorTransparent,
        indicatorColor: AppColor.kColorTransparent,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        labelTextStyle: MaterialStatePropertyAll(
          TextStyle(
            color: AppColor.kPrimaryColor,
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      child: child,
    );
  }
}
