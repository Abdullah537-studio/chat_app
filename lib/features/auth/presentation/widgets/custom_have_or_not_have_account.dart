import 'package:chat_2/core/strings/color_manager.dart';
import 'package:chat_2/core/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomHaveOrNoteHaveAccount extends StatelessWidget {
  final String text;
  final String textButton;
  final Function() onpressed;
  const CustomHaveOrNoteHaveAccount(
      {super.key,
      required this.text,
      required this.textButton,
      required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Divider(
            color: AppColor.kPrimaryColor,
            thickness: 2.w,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextWidget.textBodyMedium(text, context),
              TextButton(
                onPressed: onpressed,
                child: CustomTextWidget.textkPrimaryColor(textButton, context),
              )
            ],
          ),
        ],
      ),
    );
  }
}
