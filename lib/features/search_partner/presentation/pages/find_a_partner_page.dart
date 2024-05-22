import 'package:chat_2/core/enum/tab_bar_state.dart';
import 'package:chat_2/core/feature_button_nav_bar/presentation/bootom_navigation_tab_bar_cubit/bootom_tab_bar_cubit.dart';
import 'package:chat_2/core/enum/cubit_enum.dart';
import 'package:chat_2/core/function/validator.dart';
import 'package:chat_2/core/strings/error_strings.dart';
import 'package:chat_2/core/strings/key_translate_manger.dart';
import 'package:chat_2/core/widget/loading_indicator.dart';
import 'package:chat_2/core/widget/show_snack_bar.dart';
import 'package:chat_2/features/auth/presentation/cubit/image_cubit/image_partner_cubit.dart';
import 'package:chat_2/features/search_partner/presentation/pages/suggestions_partner_page.dart';
import 'package:chat_2/features/search_partner/presentation/widgets/custom_age_form.dart';

import 'package:chat_2/core/strings/image_svg.dart';
import 'package:chat_2/core/widget/custom_buttons_icon.dart';
import 'package:chat_2/features/search_partner/presentation/widgets/custom_gender_dropdown.dart';
import 'package:chat_2/features/search_partner/presentation/widgets/custom_form_date.dart';

import 'package:chat_2/features/ragone/presentation/widgets/custom_country_city_get.dart';
import 'package:chat_2/features/search_partner/data/models/requiest/search_partner_requiest_model.dart';
import 'package:chat_2/features/search_partner/presentation/cubit/search_partner_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FindAPartnerPage extends StatefulWidget {
  FindAPartnerPage({super.key});

  @override
  State<FindAPartnerPage> createState() => _FindAPartnerPageState();
}

class _FindAPartnerPageState extends State<FindAPartnerPage> {
  final GlobalKey<FormState> formState = GlobalKey();
  PartnerRequiest partner = PartnerRequiest();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formState,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 48.w, vertical: 12.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomCountryGet(
                onCountrySelected: (country) {
                  partner.countryId = country;
                },
                onCitySelected: (city) {
                  partner.cityId = city;
                },
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 12.h),
                child: CustomGenderDropDown(
                  genderFunction: (gender) {
                    partner.gender = gender;
                  },
                ),
              ),
              Row(
                children: [
                  Text(
                    translating(context, AppKeyTranslateManger.partnerAge),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 14.h),
                child: CustomAge(
                  validate: validationAll.validateGenerall,
                  text:
                      translating(context, AppKeyTranslateManger.maxPartnerAge),
                  getAge: (age) {
                    partner.maxAge = age;
                    validationAll.minAge = age!;
                  },
                ),
              ),
              CustomAge(
                  validate: validationAll.validateGenerall,
                  text:
                      translating(context, AppKeyTranslateManger.minPartnerAge),
                  getAge: (age) {
                    partner.minAge = age;
                    validationAll.maxAge = age!;
                  }),
              const CustomFormDate(),
              Padding(
                padding: EdgeInsets.only(bottom: 100.h),
                child: BlocConsumer<SearchPartnerCubit, SearchPartnerState>(
                  listener: (context, state) {
                    if (state.status == CubitStatus.done) {
                      SuggestionPartner.partnerInfo = state.partner!;
// * to get image partner info : have part of image  cutting must get it from method
                      context.read<ImagePartnerCubit>().getImagePartner();
// * change enum to change body to suggestionPartner
                      bodyTabBardestination = TabBarStatus.suggetionPartner;
                      context.read<BootomTabBarCubit>().getIndexTabBar();
                    } else if (state.status == CubitStatus.faild) {
                      return showSnackBar(
                        context,
                        errorInformationSignInLogInString,
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state.status == CubitStatus.loading) {
                      return const loadingIndicator();
                    } else {
                      return CustomButtonIcon(
                        image: searchIcon,
                        text:
                            translating(context, AppKeyTranslateManger.search),
                        onPressed: () {
                          if (formState.currentState!.validate()) {
                            context
                                .read<SearchPartnerCubit>()
                                .getPartner(partner);
                          }
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
