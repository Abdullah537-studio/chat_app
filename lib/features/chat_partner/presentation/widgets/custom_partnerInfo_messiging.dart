// ignore_for_file: file_names

import 'package:chat_2/core/enum/cubit_enum.dart';
import 'package:chat_2/core/function/convert_base64_to_image_partner_from_api.dart';
import 'package:chat_2/core/strings/image_svg.dart';
import 'package:chat_2/core/widget/main_text_widget.dart';
import 'package:chat_2/features/auth/presentation/cubit/image_cubit/image_partner_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomPartnerInfoMessiging extends StatelessWidget {
  const CustomPartnerInfoMessiging({
    super.key,
    required this.datelastMessage,
    required this.lastMessage,
    required this.userName,
    required this.ontap,
  });
  final Function()? ontap;
  final String datelastMessage;
  final String lastMessage;
  final String userName;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 27.h, horizontal: 10.w),
        height: 150.h,
        decoration: BoxDecoration(
            color: Theme.of(context).hoverColor,
            border: Border.all(color: Theme.of(context).hoverColor),
            borderRadius: BorderRadius.circular(24.r)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BlocBuilder<ImagePartnerCubit, ImagePartnerState>(
              builder: (context, state) {
                return Container(
                  margin: EdgeInsets.all(5),
                  height: 116.h,
                  width: 116.w,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2.w),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: state.status == CubitStatus.done
                      ? imageFromBase64String(state.image ?? '')
                      : Padding(
                          padding: const EdgeInsets.all(16),
                          child: SvgPicture.asset(imageAvatar),
                        ),
                );
              },
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MainTextWidget(
                  text: userName,
                  style: Theme.of(context).textTheme.bodyMedium!,
                  isCenter: false,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 2.h),
                  child: MainTextWidget(
                    text: lastMessage,
                    style: Theme.of(context).textTheme.bodyMedium!,
                    isCenter: false,
                  ),
                ),
              ],
            ),
            MainTextWidget(
              text: datelastMessage
                  .toString()
                  .substring(0, 10)
                  .replaceAll("-", "/"),
              style: Theme.of(context).textTheme.bodySmall!,
              isCenter: false,
            ),
          ],
        ),
      ),
    );
  }
}
