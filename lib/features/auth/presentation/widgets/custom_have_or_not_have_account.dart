import 'package:chat_2/core/strings/color_manager.dart';
import 'package:chat_2/core/widget/main_text_widget.dart';
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
      height: 130,
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
              MainTextWidget(
                text: text,
                style: Theme.of(context).textTheme.bodyMedium!,
                isCenter: false,
              ),
              TextButton(
                onPressed: onpressed,
                child: MainTextWidget(
                  text: textButton,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(color: AppColor.kPrimaryColor),
                  isCenter: false,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
