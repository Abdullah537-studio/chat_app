import 'package:chat_2/core/strings/color_manager.dart';
import 'package:chat_2/core/strings/key_translate_manger.dart';
import 'package:chat_2/core/widget/main_text_widget.dart';
import 'package:chat_2/features/search_partner/data/models/response/search_partner_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CutomSuggestionPartnerInfo extends StatelessWidget {
  final Function()? ontap;
  final Widget child;
  final PartnerResponse partnerResponse;
  const CutomSuggestionPartnerInfo({
    super.key,
    required this.partnerResponse,
    required this.child,
    required this.ontap,
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
                      color: AppColor.kColorTransparent,
                    ),
                    child: child),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MainTextWidget(
                      text: partnerResponse.userName ?? "",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: AppColor.kColorBlack),
                      isCenter: false,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: MainTextWidget(
                        text: "Age: ${partnerResponse.age}",
                        style: Theme.of(context).textTheme.bodyMedium!,
                        isCenter: false,
                      ),
                    ),
                    MainTextWidget(
                      text: "Country Name: ${partnerResponse.cityName}",
                      style: Theme.of(context).textTheme.bodyMedium,
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
              child: Container(
                decoration: BoxDecoration(
                  color: AppColor.kPrimaryColor,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColor.kColorTransparent),
                ),
                height: 60.h,
                child: GestureDetector(
                  onTap: ontap,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.search,
                        color: AppColor.kColorWhite,
                        size: 33,
                      ),
                      MainTextWidget(
                        text: translating(context,
                            AppKeyTranslateManger.text_send_message_from_sugg),
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: AppColor.kColorWhite),
                        isCenter: true,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
