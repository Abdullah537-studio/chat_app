import 'package:bloc/bloc.dart';
import 'package:chat_2/core/enum/cubit_enum.dart';
import 'package:chat_2/core/enum/theme_state.dart';
import 'package:chat_2/core/shared/shared_pref.dart';
import 'package:equatable/equatable.dart';

part 'change_theme_state.dart';

class ChangeThemeCubit extends Cubit<ChangeThemeState> {
  ChangeThemeCubit() : super(ChangeThemeState.initial());
  void getTheme(ThemesStatus theme) {
    emit(state.copyWith(status: CubitStatus.initial));
    switch (theme) {
      case ThemesStatus.initial:
        final String themeIs = AppSharedPreferences.getThemeStatusString();
        if (themeIs == "L") {
          emit(state.copyWith(
            status: CubitStatus.done,
            themeStatus: ThemesStatus.light,
            isSelected: true,
          ));
        } else {
          emit(state.copyWith(
            status: CubitStatus.done,
            themeStatus: ThemesStatus.dark,
            isSelected: false,
          ));
        }
        break;
      case ThemesStatus.dark:
        AppSharedPreferences.cacheThemeStatusAsString(theme: "D");
        emit(state.copyWith(
          themeStatus: theme,
          status: CubitStatus.done,
          isSelected: false,
        ));
        break;

      case ThemesStatus.light:
        AppSharedPreferences.cacheThemeStatusAsString(theme: "L");

        emit(state.copyWith(
          themeStatus: theme,
          status: CubitStatus.done,
          isSelected: true,
        ));
        break;
    }
  }

  void toggleTheme() {
    final currentTheme = state.themeStatus;
    ThemesStatus newTheme;

    if (currentTheme == ThemesStatus.light) {
      newTheme = ThemesStatus.dark;
      AppSharedPreferences.cacheThemeStatusAsString(theme: "D");
    } else {
      newTheme = ThemesStatus.light;
      AppSharedPreferences.cacheThemeStatusAsString(theme: "L");
    }

    emit(state.copyWith(
      themeStatus: newTheme,
      status: CubitStatus.done,
      isSelected: newTheme == ThemesStatus.light,
    ));
  }
}
