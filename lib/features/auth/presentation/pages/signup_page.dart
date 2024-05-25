import 'package:chat_2/core/enum/cubit_enum.dart';
import 'package:chat_2/core/function/validator.dart';
import 'package:chat_2/core/strings/color_manager.dart';
import 'package:chat_2/core/strings/image_png.dart';
import 'package:chat_2/core/strings/key_translate_manger.dart';
import 'package:chat_2/core/strings/route_named_screens_string.dart';
import 'package:chat_2/core/widget/custom_button.dart';
import 'package:chat_2/core/widget/custom_text.dart';
import 'package:chat_2/core/widget/custom_text_form_filed.dart';
import 'package:chat_2/core/widget/loading_indicator.dart';
import 'package:chat_2/core/widget/show_snack_bar.dart';
import 'package:chat_2/features/auth/domin/entites/auth_model/requiest/signup_request_entity.dart';
import 'package:chat_2/features/auth/presentation/cubit/sign_up/sign_up_cubit.dart';
import 'package:chat_2/features/auth/presentation/pages/show_dialog_to_done.dart';
import 'package:chat_2/features/auth/presentation/widgets/accept_the_Terms_and_Services.dart';
import 'package:chat_2/features/auth/presentation/widgets/custom_container_image.dart';
import 'package:chat_2/features/auth/presentation/widgets/custom_have_or_not_have_account.dart';
import 'package:chat_2/features/ragone/presentation/widgets/custom_country_city_get.dart';
import 'package:chat_2/features/search_partner/presentation/widgets/custom_gender_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class SignUpPage extends StatelessWidget {
  static String? passwordToValidate;
  static String? userNameForImage;
  const SignUpPage({super.key});
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formStateSignUp = GlobalKey();
    SigninRequest signinEntite = SigninRequest();
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            AppImageStringPng.backgroundSignIn,
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: Form(
        key: formStateSignUp,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: ListView(
            padding: EdgeInsets.symmetric(horizontal: 46.w, vertical: 30.h),
            children: [
              Align(
                alignment: Alignment.center,
                child: CustomTextWidget.textTitleMedium(
                    translating(context, AppKeyTranslateManger.singup),
                    context),
              ),
              CustomImage(
                imageFunction: (image) {
                  debugPrint(image);
                  signinEntite.avatar = image;
                },
              ),
              //?-------- name && age --------------------------------------------------------
              CustomTextFormFiled(
                hintText: translating(context, AppKeyTranslateManger.name),
                keyboardTybe: TextInputType.name,
                showPassword: false,
                validate: validationAll.validateGenerall,
                onChange: (value) {
                  signinEntite.name = value;
                },
              ),
              CustomTextFormFiled(
                showPassword: false,
                hintText: translating(context, AppKeyTranslateManger.age),
                keyboardTybe: TextInputType.number,
                validate: validationAll.validateAgeNumber,
                onChange: (value) {
                  value = value!.isEmpty ? "0" : value;
                  if (value is NumberFormat) {
                    int age = int.parse(value);
                    signinEntite.age = age;
                  }
                },
              ),
              //?---------dropDownButton: Gender ---------------------------------------------
              CustomGenderDropDown(
                genderFunction: (gender) => signinEntite.gender = gender,
              ),
              //?------------dropDownButton: country && city----------------------------------
              CustomCountryGet(
                onCountrySelected: (selectedCountry) {
                  signinEntite.countryId = selectedCountry;
                },
                onCitySelected: (selectedCity) {
                  signinEntite.cityId = selectedCity;
                },
              ),
              //?-----------phone && email----------------------------------------------------
              CustomTextFormFiled(
                hintText: translating(context, AppKeyTranslateManger.phone),
                keyboardTybe: TextInputType.phone,
                showPassword: false,
                validate: validationAll.validatePhoneNumber,
                onChange: (value) {
                  signinEntite.phoneNumber = value;
                },
              ),
              CustomTextFormFiled(
                hintText: translating(context, AppKeyTranslateManger.email),
                keyboardTybe: TextInputType.emailAddress,
                showPassword: false,
                validate: validationAll.validateEmail,
                icon: Icon(
                  Icons.email,
                  size: 35.r,
                ),
                onChange: (value) {
                  signinEntite.emailAddress = value;
                },
              ),
              //?---------- password && reenter password -------------------------------------
              CustomTextFormFiled(
                hintText: translating(context, AppKeyTranslateManger.password),
                keyboardTybe: TextInputType.visiblePassword,
                showPassword: true,
                icon: Icon(
                  Icons.vpn_key,
                  size: 35.r,
                ),
                validate: validationAll.validatePassword,
                onChange: (value) {
                  signinEntite.password = value!;
                  passwordToValidate = value;
                },
              ),
              CustomTextFormFiled(
                hintText:
                    translating(context, AppKeyTranslateManger.reenterPassword),
                keyboardTybe: TextInputType.visiblePassword,
                showPassword: true,
                validate: validationAll.validateReenterPassword,
                icon: Icon(
                  Icons.vpn_key,
                  size: 35.r,
                ),
                onChange: (value) {},
              ),
              //?-----------------accept system ----------------------------------------------
              AcceptTheTermsAndServices(),
              //?----------------button signup------------------------------------------------
              BlocConsumer<SignUpCubit, SignUpState>(
                listener: (context, state) {
                  if (state.status == CubitStatus.faild) {
                    showSnackBar(
                      context,
                      translating(context, AppKeyTranslateManger.errorInfo),
                    );
                  }
                  if (state.status == CubitStatus.done) {
                    showDialog(
                        context: context,
                        builder: (_) => const LoginToContainue());
                  }
                },
                builder: (context, state) {
                  if (state.status == CubitStatus.loading) {
                    return const loadingIndicator();
                  } else {
                    return CustomButto(
                      backgroundColor: AppColor.kPrimaryColor,
                      borderColor: AppColor.kColorWhite,
                      onPressed: () {
                        validationAll.passwordValidate = signinEntite.password;
                        if (formStateSignUp.currentState!.validate()) {
                          context
                              .read<SignUpCubit>()
                              .signin(signinEntity: signinEntite);
                        }
                      },
                      text: translating(context, AppKeyTranslateManger.singup),
                    );
                  }
                },
              )
            ],
          ),
          //?------------------------- if have account already
          bottomNavigationBar: CustomHaveOrNoteHaveAccount(
              text: translating(
                  context, AppKeyTranslateManger.already_have_account),
              textButton: translating(context, AppKeyTranslateManger.login),
              onpressed: () {
                Navigator.of(context).pushReplacementNamed(
                    RouteNamedScreens.loginScreenNameRoute);
              }),
        ),
      ),
    );
  }
}
