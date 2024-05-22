import 'package:chat_2/core/strings/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomChatBubleUser extends StatelessWidget {
  const CustomChatBubleUser({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: EdgeInsets.only(bottom: 19.h),
        decoration: BoxDecoration(
          color: AppColor.kColorBlack,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.r),
            topLeft: Radius.circular(12.r),
            topRight: Radius.circular(12.r),
            bottomRight: Radius.circular(12.r),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: AppColor.kColorWhite,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
