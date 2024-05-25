import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

OutlineInputBorder outlineInputBorder(Color borderColor) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(16.r),
    borderSide: BorderSide(
      width: 2.w,
      color: borderColor,
    ),
  );
}
