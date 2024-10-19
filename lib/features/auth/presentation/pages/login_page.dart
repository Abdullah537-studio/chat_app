import 'package:chat_2/core/enum/cubit_enum.dart';
import 'package:chat_2/core/function/main_functions/validator.dart';
import 'package:chat_2/core/shared/shared_pref.dart';
import 'package:chat_2/core/strings/color_manager.dart';
import 'package:chat_2/core/strings/image_png.dart';
import 'package:chat_2/core/strings/key_translate_manger.dart';
import 'package:chat_2/core/strings/route_named_screens_string.dart';
import 'package:chat_2/core/widget/custom_button.dart';
import 'package:chat_2/core/widget/main_text_form_filed.dart';
import 'package:chat_2/core/widget/loading_indicator.dart';
import 'package:chat_2/core/widget/main_text_widget.dart';
import 'package:chat_2/core/widget/show_snack_bar.dart';
import 'package:chat_2/features/auth/domin/entites/auth_model/requiest/login_request_entity.dart';
import 'package:chat_2/features/auth/presentation/cubit/auth_cubit/login_cubit.dart';
import 'package:chat_2/features/auth/presentation/widgets/custom_have_or_not_have_account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKeyLogin = GlobalKey();
    LoginRequest loginEntite = LoginRequest();

    bool rememberMe = false;
    return Scaffold(
      backgroundColor: AppColor.kColorTransparent,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 40.h, vertical: 50.h),
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImageStringPng.backgroundLogin),
            fit: BoxFit.cover,
          ),
        ),
        child: Form(
          key: formKeyLogin,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 75.h),
                    child: MainTextWidget(
                        text: translating(context, AppKeyTranslateManger.login),
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: AppColor.kColorBlack),
                        isCenter: true)),
                //?--------------------------Email----------------------------------------------
                MainTextFormField(
                  keyboardTybe: TextInputType.emailAddress,
                  onPressedIcon: null,
                  textInputFormatter: null,
                  onEdithingComplete: null,
                  showPassword: false,
                  validate: validationAll(context: context).validateEmail,
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
                MainTextFormField(
                  onPressedIcon: null,
                  textInputFormatter: null,
                  onEdithingComplete: null,
                  keyboardTybe: TextInputType.visiblePassword,
                  showPassword: true,
                  validate: validationAll(context: context).validatePassword,
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
                Padding(
                  padding: EdgeInsets.only(bottom: 20.h),
                  child: StatefulBuilder(
                    builder: (BuildContext context, setState) {
                      return Row(
                        children: [
                          Checkbox(
                            activeColor: AppColor.kPrimaryColor,
                            value: rememberMe,
                            onChanged: (value) {
                              setState(
                                () {
                                  rememberMe = value ?? false;
                                },
                              );
                            },
                          ),
                          MainTextWidget(
                            text: translating(
                              context,
                              AppKeyTranslateManger.rememberMe,
                            ),
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: rememberMe
                                      ? AppColor.kPrimaryColor
                                      : AppColor.kColorBlack,
                                ),
                            isCenter: false,
                          ),
                        ],
                      );
                    },
                  ),
                ),
                //?----------------------button login-------------------------------------------
                BlocConsumer<LoginCubit, LoginState>(
                  listener: (context, state) {
                    if (state.status == CubitStatus.faild) {
                      showSnackBarMain(
                        context,
                        translating(
                          context,
                          AppKeyTranslateManger.errorInfo,
                        ),
                      );
                    }
                    if (state.status == CubitStatus.done) {
                      AppSharedPreferences.cacheRememberMeValue(rememberMe);
                      AppSharedPreferences.cachIdDialogChatBubblePartner(
                          id: "");
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
                    return MainButton(
                      backgroundColor: AppColor.kPrimaryColor,
                      borderColor: AppColor.kColorWhite,
                      text: translating(context, AppKeyTranslateManger.login),
                      onPressed: () {
                        if (formKeyLogin.currentState?.validate() ?? false) {
                          context
                              .read<LoginCubit>()
                              .login(loginEntity: loginEntite);
                        }
                      },
                    );
                  },
                ),
                //?-------------- ask user {dont have account : signup}
                CustomHaveOrNoteHaveAccount(
                  text: translating(
                      context, AppKeyTranslateManger.not_have_an_account),
                  textButton:
                      translating(context, AppKeyTranslateManger.singup),
                  onpressed: () {
                    Navigator.of(context).pushReplacementNamed(
                        RouteNamedScreens.signinScreenNameRoute);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
