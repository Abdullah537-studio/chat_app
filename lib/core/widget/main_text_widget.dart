import 'package:flutter/material.dart';

class MainTextWidget extends StatelessWidget {
  const MainTextWidget(
      {super.key,
      required this.text,
      required this.style,
      required this.isCenter});
  final String text;
  final TextStyle? style;
  final bool isCenter;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: isCenter ? TextAlign.center : null,
    );
  }
}
