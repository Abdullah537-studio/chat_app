// ignore_for_file: unrelated_type_equality_checks

import 'package:chat_2/core/enum/cubit_enum.dart';
import 'package:chat_2/core/function/validator.dart';
import 'package:chat_2/core/shared/shared_pref.dart';
import 'package:chat_2/core/strings/color_manager.dart';
import 'package:chat_2/core/strings/image_png.dart';
import 'package:chat_2/core/strings/key_translate_manger.dart';
import 'package:chat_2/core/strings/route_named_screens_string.dart';
import 'package:chat_2/core/widget/custom_button.dart';
import 'package:chat_2/core/widget/custom_text.dart';
import 'package:chat_2/core/widget/custom_text_form_filed.dart';
import 'package:chat_2/core/widget/loading_indicator.dart';
import 'package:chat_2/core/widget/show_snack_bar.dart';
import 'package:chat_2/features/auth/domin/entites/auth_model/requiest/login_request_entity.dart';
import 'package:chat_2/features/auth/presentation/cubit/auth_cubit/login_cubit.dart';
import 'package:chat_2/features/auth/presentation/widgets/custom_have_or_not_have_account.dart';
import 'package:chat_2/features/auth/presentation/widgets/custom_remember_me.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formState = GlobalKey();
    bool rememberMe = false;
    LoginRequest loginEntite = LoginRequest();
//!---------container for background image --------
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            AppImageStringPng.backgroundLogin,
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
//?-------------ask to login if you do register last time ----------------------
        bottomNavigationBar: CustomHaveOrNoteHaveAccount(
          text: translating(context, AppKeyTranslateManger.not_have_an_account),
          textButton: translating(context, AppKeyTranslateManger.singup),
          onpressed: () {
            Navigator.pushReplacementNamed(
              context,
              RouteNamedScreens.signinScreenNameRoute,
            );
          },
        ),
        backgroundColor: Colors.transparent,
        body: Form(
          key: formState,
          child: Padding(
            padding: EdgeInsets.only(left: 48.w, right: 48.w, top: 30.h),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 75.h),
                    child: CustomTextWidget.textBodyMedium(
                      translating(context, AppKeyTranslateManger.login),
                      context,
                    ),
                  ),
                  //?--------------------------Email----------------------------------------------
                  CustomTextFormFiled(
                    keyboardTybe: TextInputType.emailAddress,
                    showPassword: false,
                    validate: validationAll.validateEmail,
                    icon: Icon(
                      Icons.email,
                      size: 35.r,
                    ),
                    hintText: translating(context, AppKeyTranslateManger.email),
                    onChange: (value) {
                      loginEntite.email = value;
                    },
                  ),
                  //?--------------------------Passwrod-------------------------------------------
                  CustomTextFormFiled(
                    keyboardTybe: TextInputType.visiblePassword,
                    showPassword: true,
                    validate: validationAll.validatePassword,
                    icon: Icon(
                      Icons.vpn_key,
                      size: 35.r,
                    ),
                    hintText:
                        translating(context, AppKeyTranslateManger.password),
                    onChange: (value) {
                      loginEntite.password = value;
                    },
                  ),
                  //?--------------------rememberMe-----------------------------------------------
                  RememberMe(
                    isRememberMe: (rem) {
                      rememberMe = rem;
                    },
                  ),
                  //?----------------------button login-------------------------------------------
                  BlocConsumer<LoginCubit, LoginState>(
                    listener: (context, state) {
                      if (state.status == CubitStatus.faild) {
                        showSnackBar(
                          context,
                          translating(
                            context,
                            AppKeyTranslateManger.errorInfo,
                          ),
                        );
                      }
                      if (state.status == CubitStatus.done) {
                        AppSharedPreferences.cacheRememberMeValue(rememberMe);
                        Navigator.pushReplacementNamed(
                          context,
                          RouteNamedScreens.boottomTabBarScreenNameRoute,
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state.status == CubitStatus.loading) {
                        return const loadingIndicator();
                      }
                      return CustomButto(
                        backgroundColor: AppColor.kPrimaryColor,
                        borderColor: AppColor.kColorWhite,
                        text: translating(context, AppKeyTranslateManger.login),
                        onPressed: () {
                          if (formState.currentState!.validate()) {
                            context
                                .read<LoginCubit>()
                                .login(loginEntity: loginEntite);
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
