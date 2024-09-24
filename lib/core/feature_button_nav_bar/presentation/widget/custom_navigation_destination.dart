// ignore_for_file: deprecated_member_use

import 'package:chat_2/core/enum/tab_bar_state.dart';
import 'package:chat_2/core/feature_button_nav_bar/presentation/bootom_navigation_tab_bar_cubit/bootom_tab_bar_cubit.dart';
import 'package:chat_2/core/strings/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomNavigationDestination extends StatelessWidget {
  const CustomNavigationDestination({
    super.key,
    required this.text,
    required this.childDisable,
    required this.childenable,
    required this.ontap,
  });
  final Function()? ontap;
  final String text;
  final String childDisable;
  final String childenable;
  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      icon: GestureDetector(
        onTap: ontap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset(
              childDisable,
              width: 40.w,
              height: 40.h,
              color: AppColor.kColorIconDisable,
            ),
            Text(
              text,
              style: TextStyle(
                color: AppColor.kColorBlack,
                fontSize: 20.sp,
              ),
            )
          ],
        ),
      ),
      selectedIcon: GestureDetector(
        onTap: () {
          bodyTabBardestination = TabBarStatus.suggetionPartner;
          context.read<BootomTabBarCubit>().getIndexTabBar();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset(
              childenable,
              width: 40.w,
              height: 40.h,
              color: AppColor.kPrimaryColor,
            ),
            Text(
              text,
              style: TextStyle(
                color: AppColor.kPrimaryColor,
                fontSize: 20.sp,
              ),
            )
          ],
        ),
      ),
      label: '',
    );
  }
}
