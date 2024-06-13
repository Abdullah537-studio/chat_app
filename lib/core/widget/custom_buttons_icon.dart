// ignore_for_file: deprecated_member_use

import 'package:chat_2/core/strings/color_manager.dart';
import 'package:chat_2/core/widget/main_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      height: 60.h,
      minWidth: double.infinity,
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Icon(
              size: 35,
              Icons.search,
              color: AppColor.kColorWhite,
            ),
          ),
          MainTextWidget(
            text: text,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: AppColor.kColorWhite),
            isCenter: false,
          )
        ],
      ),
    );
  }
}
