// ignore_for_file: deprecated_member_use

import 'package:chat_2/core/strings/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomButtonIcon extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  final String image;
  const CustomButtonIcon({
    required this.text,
    required this.onPressed,
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 30.h,
      minWidth: double.infinity.w,
      color: AppColor.kPrimaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r),
        side: BorderSide(
          color: AppColor.kPrimaryColor,
          width: 2.w,
        ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Tab(
              child: SizedBox(
            height: 24.h,
            width: 24.w,
            child: SvgPicture.asset(
              image,
              color: AppColor.kColorWhite,
              fit: BoxFit.cover,
            ),
          )),
          SizedBox(width: 14.w),
          Text(
            text,
            style: TextStyle(color: AppColor.kColorWhite, fontSize: 20.sp),
          ),
        ],
      ),
    );
  }
}
