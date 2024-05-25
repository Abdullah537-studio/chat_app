import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

OutlineInputBorder outlineInputBorderBoxChat(Color borderColor) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(50.r)),
    borderSide: BorderSide(color: borderColor, width: 2.w),
  );
}
