import 'package:chat_2/core/strings/color_manager.dart';
import 'package:chat_2/core/strings/key_translate_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBoxSendMessage extends StatelessWidget {
  const CustomBoxSendMessage({
    super.key,
    this.onChangeTextFormField,
    this.onPressedIconSendMessage,
  });
  final Function(String)? onChangeTextFormField;
  final Function()? onPressedIconSendMessage;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      width: double.infinity,
      child: TextField(
        onEditingComplete: onPressedIconSendMessage,
        onChanged: onChangeTextFormField,
        style: Theme.of(context).textTheme.bodyMedium,
        cursorColor: AppColor.kPrimaryColor,
        cursorHeight: 30.h,
        decoration: InputDecoration(
          focusColor: AppColor.kColorWhite,

          hintText: translating(context, AppKeyTranslateManger.write_a_message),
          hintStyle: Theme.of(context).textTheme.labelMedium,
          suffixIcon: IconButton(
              icon: const Icon(Icons.send),
              onPressed: onPressedIconSendMessage),
          contentPadding: EdgeInsets.only(left: 20.w),
          //? -------border
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100.r),
            borderSide:
                BorderSide(width: 1.w, color: Theme.of(context).hintColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100.r),
            borderSide:
                BorderSide(width: 1.w, color: Theme.of(context).hintColor),
          ),
        ),
      ),
    );
  }
}
