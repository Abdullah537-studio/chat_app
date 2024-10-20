import 'package:chat_2/core/strings/color_manager.dart';
import 'package:chat_2/core/strings/key_translate_manger.dart';
import 'package:chat_2/generate/theme/custom_outline_input_border_box_send_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBoxSendMessage extends StatelessWidget {
  const CustomBoxSendMessage({
    super.key,
    this.onChangeTextFormField,
    this.onPressedIconSendMessage,
    this.controller,
  });
  final Function(String)? onChangeTextFormField;
  final Function()? onPressedIconSendMessage;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 15.h),
        child: Theme(
//----------try it
          data: Theme.of(context).copyWith(primaryColor: AppColor.kColorWhite),
          child: TextField(
            controller: controller,
            onEditingComplete: onPressedIconSendMessage,
            onChanged: onChangeTextFormField,
            style: Theme.of(context).textTheme.bodyMedium,
            cursorColor: AppColor.kPrimaryColor,
            cursorHeight: 25.h,
            decoration: InputDecoration(
              focusColor: AppColor.kColorBlack,
              hintText:
                  translating(context, AppKeyTranslateManger.write_a_message),
              hintStyle: Theme.of(context).textTheme.labelMedium,
              suffixIcon: IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: onPressedIconSendMessage),
              contentPadding: EdgeInsets.only(left: 20.w),
              //? -------border
              focusedBorder: outlineInputBorderBoxChat(AppColor.kPrimaryColor),
              enabledBorder: outlineInputBorderBoxChat(AppColor.kColorBlack),
            ),
          ),
        ));
  }
}
