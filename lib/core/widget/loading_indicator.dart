import 'package:chat_2/core/strings/color_manager.dart';
import 'package:flutter/material.dart';

class loadingIndicator extends StatelessWidget {
  const loadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: AppColor.kPrimaryColor,
      ),
    );
  }
}
