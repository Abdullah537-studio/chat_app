// ignore_for_file: deprecated_member_use

import 'package:chat_2/core/strings/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

BottomNavigationBarItem bottomItem(String icon, String text) {
  return BottomNavigationBarItem(
    label: text,
    icon: SvgPicture.asset(
      icon,
      color: AppColor.kColorBlack,
      height: 30,
      width: 30,
    ),
    activeIcon: SvgPicture.asset(
      icon,
      color: AppColor.kPrimaryColor,
      height: 30,
      width: 30,
    ),
  );
}
