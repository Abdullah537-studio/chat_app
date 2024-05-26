import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainButton extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  final Color backgroundColor;
  final Color borderColor;
  const MainButton({
    required this.text,
    required this.onPressed,
    super.key,
    required this.backgroundColor,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      child: MaterialButton(
        height: 70.h,
        minWidth: 320.w,
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
          side: BorderSide(
            color: borderColor,
            width: 2.w,
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: borderColor, fontSize: 20.sp),
        ),
      ),
    );
  }
}
