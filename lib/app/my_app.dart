import 'package:chat_2/core/shared/shared_pref.dart';
import 'package:chat_2/core/strings/language_code_string.dart';
import 'package:chat_2/core/strings/state_theme_string.dart';

import '../../generate/app_localizations/app_localizations.dart';
import '../generate/cuibt_theme_translate/change_theme/change_theme_cubit.dart';
import '../generate/cuibt_theme_translate/translate/local_translate_cubit.dart';
import 'package:chat_2/core/enum/cubit_enum.dart';
import 'package:chat_2/core/enum/theme_state.dart';
import 'package:chat_2/generate/theme/dark_theme_data.dart';
import 'package:chat_2/generate/theme/light_theme_data.dart';
import 'package:chat_2/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final AppRouter appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    ThemesStatus themesStatus = AppSharedPreferences.getThemeStatusString() ==
            AppStateThemeString.lightTheme
        ? ThemesStatus.light
        : ThemesStatus.dark;
    return ScreenUtilInit(
      designSize: const Size(412, 870),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return SafeArea(
            child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => LocalTranslateCubit()..getSavedLanguage(),
            ),
            BlocProvider(
              create: (context) =>
                  ChangeThemeCubit()..getTheme(ThemesStatus.initial),
            )
          ],
          child: BlocBuilder<ChangeThemeCubit, ChangeThemeState>(
            builder: (context, state) {
              themesStatus = state.themeStatus;
              return BlocBuilder<LocalTranslateCubit, LocalTranslateState>(
                builder: (context, state) {
                  if (state.status == CubitStatus.done) {
                    AppSharedPreferences.cacheLanguageCode(
                        languageCode: state.locale?.languageCode ?? 'en');
                    return MaterialApp(
                      debugShowCheckedModeBanner: false,
                      locale: state.locale,
                      supportedLocales: [
                        Locale(lagnuageCodeString.english),
                        Locale(lagnuageCodeString.arabic),
                      ],
                      localizationsDelegates: [
                        //? creat delegate for my app named :AppLocalization
                        AppLocalization.delegate,
                        GlobalMaterialLocalizations.delegate,
                        GlobalWidgetsLocalizations.delegate,
                        GlobalCupertinoLocalizations.delegate,
                      ],
                      localeResolutionCallback:
                          (deviceLocal, supportedLocales) {
                        for (var local in supportedLocales) {
                          if (deviceLocal != null &&
                              deviceLocal.languageCode == local.languageCode) {
                            return deviceLocal;
                          }
                        }
                        return supportedLocales.first;
                      },
                      title: 'Flutter Demo',
                      theme: themesStatus == ThemesStatus.light
                          ? lightTheme
                          : darkTheme,
                      onGenerateRoute: appRouter.onGenerateRoute,
                    );
                  }
                  return SizedBox();
                },
              );
            },
          ),
        ));
      },
    );
  }
}
