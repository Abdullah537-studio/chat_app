import 'package:chat_2/core/feature_button_nav_bar/presentation/bootom_navigation_tab_bar_cubit/bootom_tab_bar_cubit.dart';

import 'package:chat_2/core/strings/route_named_screens_string.dart';
import 'package:chat_2/core/feature_button_nav_bar/presentation/pages/bootm_tab_bar_all_pages.dart';
import 'package:chat_2/features/auth/presentation/cubit/auth_cubit/login_cubit.dart';
import 'package:chat_2/features/auth/presentation/cubit/image_cubit/image_partner_cubit.dart';
import 'package:chat_2/features/auth/presentation/cubit/sign_up/sign_up_cubit.dart';
import 'package:chat_2/features/auth/presentation/pages/ask_login_or_signup.dart';
import 'package:chat_2/features/auth/presentation/pages/login_page.dart';
import 'package:chat_2/features/auth/presentation/pages/signup_page.dart';
import 'package:chat_2/features/chat_partner/presentation/cubits/chat_dialog_cubit/chat_dialog_cubit.dart';
import 'package:chat_2/features/chat_partner/presentation/cubits/chat_partner_cubit/chat_partner_bubble_cubit.dart';
import 'package:chat_2/features/chat_partner/presentation/cubits/chat_partner_info_cubit/chat_partner_info_cubit.dart';
import 'package:chat_2/features/chat_partner/presentation/pages/chat_bubble_with_partner_page.dart';
import 'package:chat_2/features/ragone/presentation/cubit/city_cubit.dart';
import 'package:chat_2/features/ragone/presentation/cubit/country_cubit.dart';
import 'package:chat_2/features/intro/pages/intro1_splash_view.dart';
import 'package:chat_2/features/search_partner/presentation/cubit/search_partner_cubit.dart';
import 'package:chat_2/home/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../injection/injection_container.dart' as di;

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    // var arg = settings.arguments;
    switch (settings.name) {
//?-----show splach view -------------------------------------------------------
      case RouteNamedScreens.splashScreenNameRoute:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );

//?-----choose ?? login or singin ----------------------------------------------
      case RouteNamedScreens.loginorSignScreenNameRoute:
        return MaterialPageRoute(
          builder: (_) => const LoginOrSignupPage(),
        );

//?-------------Login Screen ---------------------------------------------------
      case RouteNamedScreens.loginScreenNameRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => di.sl<LoginCubit>(),
            child: LoginPage(),
          ),
        );

//?-------------signin screen --------------------------------------------------
      case RouteNamedScreens.signinScreenNameRoute:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => di.sl<CityCubit>(),
              ),
              BlocProvider(
                create: (context) => di.sl<CountryCubit>()..getAllCountry(),
              ),
              BlocProvider(
                create: (context) => di.sl<SignUpCubit>(),
              )
            ],
            child: const SignUpPage(),
          ),
        );

//?-------------bottom tab bar screens -----------------------------------------
      case RouteNamedScreens.boottomTabBarScreenNameRoute:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => di.sl<BootomTabBarCubit>(),
              ),
              BlocProvider(
                create: (_) =>
                    di.sl<ChatPartnerInfoCubit>()..getAllChatPartner(),
              ),
              BlocProvider(
                create: (context) =>
                    di.sl<ImagePartnerCubit>()..getImagePartner(),
              ),
              BlocProvider(
                create: (_) => di.sl<CountryCubit>()..getAllCountry(),
              ),
              BlocProvider(
                create: (_) => di.sl<CityCubit>(),
              ),
              BlocProvider(
                create: (_) => di.sl<SearchPartnerCubit>(),
              ),
              BlocProvider(
                create: (_) => di.sl<ChatPartnerBubbleCubit>(),
              ),
              BlocProvider(
                create: (_) => di.sl<ChatDialogCubit>()..getChatDialog(),
              ),
            ],
            child: BootomNabigationAllPages(),
          ),
        );

//?-------------chat bubble screen ---------------------------------------------
      case RouteNamedScreens.chatBubbleScreenNameRoute:
        // arg as Map<String, int>;
        // String chatDialogId =
        //     AppSharedPreferences.dialogChatBubblePartnerById();
        // DialogChatRequiest dialogChatRequiest =
        //     DialogChatRequiest(id: chatDialogId);
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => di.sl<ChatPartnerBubbleCubit>(),
              ),
              BlocProvider(
                create: (context) => di.sl<ChatDialogCubit>()..getChatDialog(),
              )
            ],
            child: const ChatBubblePartnerPage(
                // data: arg,
                ),
          ),
        );

      case RouteNamedScreens.settingScreeenSnameRoute:
        return MaterialPageRoute(
          builder: (context) => SettingPage(),
        );
//!-----------
    }
    return null;
  }
}
