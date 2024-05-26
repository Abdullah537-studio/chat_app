import 'package:chat_2/core/enum/tab_bar_state.dart';
import 'package:chat_2/core/feature_button_nav_bar/presentation/bootom_navigation_tab_bar_cubit/bootom_tab_bar_cubit.dart';
import 'package:chat_2/core/strings/color_manager.dart';
import 'package:chat_2/core/strings/image_svg.dart';
import 'package:chat_2/core/widget/custom_buttons_icon.dart';
import 'package:chat_2/core/widget/main_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CutomSuggestionPartnerInfo extends StatelessWidget {
  final String name;
  final String age;
  final String cityName;
  final int id;
  final Widget child;

  const CutomSuggestionPartnerInfo({
    super.key,
    required this.id,
    required this.name,
    required this.age,
    required this.cityName,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 275.w,
      padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 20.w),
      child: Stack(
        //? clipBehavior: to show button out card
        clipBehavior: Clip.none,
        alignment: AlignmentDirectional.bottomCenter,
        children: [
//!----------------- physicalModel: to show shadow -----------------------------
          PhysicalModel(
            color: Theme.of(context).hoverColor,
            elevation: 8,
            shadowColor: AppColor.kColorBlack,
            borderRadius: BorderRadius.circular(20.r),
            //? Row to put image and partner information with same lane
            child: Row(
              children: [
                Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 12.h, horizontal: 10.w),
                    height: 120.h,
                    width: 120.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18.r),
                        border:
                            Border.all(color: AppColor.kColorBlack, width: 2.w),
                        color: AppColor.kColorTransparent),
                    child: child),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MainTextWidget(
                      text: name,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: AppColor.kColorBlack),
                      isCenter: false,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: MainTextWidget(
                        text: "Age: $age",
                        style: Theme.of(context).textTheme.bodyMedium!,
                        isCenter: false,
                      ),
                    ),
                    MainTextWidget(
                      text: "Country Name: $cityName",
                      style: Theme.of(context).textTheme.bodyMedium!,
                      isCenter: false,
                    ),
                  ],
                ),
              ],
            ),
          ),
//! -----------------align button between card and out card --------------------
          Positioned(
            bottom: -40.h,
            right: 10.w,
            left: 10.w,
            child: Container(
              height: 50.h,
              margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
              child: CustomButtonIcon(
                image: chatIcon,
                text: "Send a message",
                onPressed: () {
                  bodyTabBardestination = TabBarStatus.chatBubble;
                  context.read<BootomTabBarCubit>().getIndexTabBar();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
