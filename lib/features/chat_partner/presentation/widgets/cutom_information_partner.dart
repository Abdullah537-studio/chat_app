import 'package:chat_2/core/widget/custom_text.dart';
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
            child: CustomTextWidget.textBodySmall(name, context)),
        CustomTextWidget.textBodySmall("Age: $age", context),
        CustomTextWidget.textBodySmall("Country name: $cityName", context),
      ],
    );
  }
}
