import '../../generate/cuibt_theme_translate/translate/local_translate_cubit.dart';
import 'package:chat_2/core/enum/cubit_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropdownTranslateAppBar extends StatelessWidget {
  const CustomDropdownTranslateAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      child: BlocBuilder<LocalTranslateCubit, LocalTranslateState>(
        builder: (context, state) {
          if (state.status == CubitStatus.done) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: DropdownButton(
                dropdownColor: Theme.of(context).cardColor,
                value: state.locale!.languageCode,
                icon: Icon(Icons.language),
                items: ["en", "ar"]
                    .map(
                      (String item) => DropdownMenuItem(
                        value: item,
                        child: Text(
                          item,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (val) {
                  if (val != null) {
                    context.read<LocalTranslateCubit>().languageCode(val);
                  } else {
                    context.read<LocalTranslateCubit>().getSavedLanguage();
                  }
                },
              ),
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
