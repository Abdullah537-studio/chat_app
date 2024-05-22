import 'package:chat_2/core/strings/image_png.dart';

import '../../generate/cuibt_theme_translate/change_theme/change_theme_cubit.dart';
import 'package:chat_2/core/enum/theme_state.dart';
import 'package:chat_2/core/strings/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LeadingChangeTheme extends StatelessWidget {
  const LeadingChangeTheme({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeThemeCubit, ChangeThemeState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Switch(
            activeThumbImage: AssetImage(AppImageStringPng.moonImagePng),
            inactiveThumbImage: AssetImage(AppImageStringPng.sunImagePng),
            focusColor: AppColor.kColorBlack,
            inactiveThumbColor: AppColor.kColorBlack,
            activeColor: AppColor.kColorWhite,
            value: state.themeStatus == ThemesStatus.light ? false : true,
            onChanged: (val) {
              context.read<ChangeThemeCubit>()..toggleTheme();
            },
          ),
        );
      },
    );
  }
}
