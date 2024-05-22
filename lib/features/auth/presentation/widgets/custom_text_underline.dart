import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomtextUnderLine extends StatelessWidget {
  final String text;
  final String textPressed;
  final Color color;
  const CustomtextUnderLine({
    super.key,
    required this.text,
    required this.textPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(
              color: color,
              fontSize: 15.sp,
            ),
          ),
          RichText(
            text: TextSpan(
              text: textPressed,
              style: TextStyle(
                color: color,
                fontSize: 15.sp,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.solid,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
