// ignore_for_file: must_be_immutable

import '../../../../../generate/app_localizations/app_localizations.dart';
import 'package:chat_2/core/strings/color_manager.dart';
import 'package:chat_2/core/strings/key_translate_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RememberMe extends StatefulWidget {
  dynamic Function(bool)? isRememberMe;
  bool rememberMe = false;
  RememberMe({super.key, required this.isRememberMe});

  @override
  State<RememberMe> createState() => _RememberMeState();
}

class _RememberMeState extends State<RememberMe> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Row(
        children: [
          Checkbox(
            activeColor: AppColor.kPrimaryColor,
            value: widget.rememberMe,
            onChanged: (value) {
              setState(
                () {
                  widget.rememberMe = value!;
                  widget.isRememberMe!(widget.rememberMe);
                },
              );
            },
          ),
          Text(
            AppLocalization.of(context)!.translate(
              AppKeyTranslateManger.rememberMe,
            ),
            style: TextStyle(
              fontSize: 16.sp,
              color: widget.rememberMe
                  ? AppColor.kPrimaryColor
                  : AppColor.kColorBlack,
            ),
          ),
        ],
      ),
    );
  }
}
