import 'package:chat_2/core/widget/main_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomInformationPartner extends StatelessWidget {
  const CustomInformationPartner({
    super.key,
    required this.name,
    required this.age,
    required this.cityName,
  });
  final String name;
  final String age;
  final String cityName;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 8.h, bottom: 25.h),
          child: MainTextWidget(
              text: name,
              style: Theme.of(context).textTheme.bodySmall!,
              isCenter: false),
        ),
        MainTextWidget(
          text: "Age: $age",
          style: Theme.of(context).textTheme.bodySmall!,
          isCenter: false,
        ),
        MainTextWidget(
          text: "Country name: $cityName",
          style: Theme.of(context).textTheme.bodySmall!,
          isCenter: false,
        )
      ],
    );
  }
}
