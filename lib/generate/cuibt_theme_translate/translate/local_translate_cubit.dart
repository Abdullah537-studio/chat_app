import 'package:bloc/bloc.dart';
import 'package:chat_2/core/enum/cubit_enum.dart';
import 'package:chat_2/core/shared/shared_pref.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'local_translate_state.dart';

class LocalTranslateCubit extends Cubit<LocalTranslateState> {
  LocalTranslateCubit() : super(LocalTranslateState.initial());

  Future<void> getSavedLanguage() async {
    emit(state.copyWith(status: CubitStatus.loading));
    String language = await AppSharedPreferences.getLanguageCode();
    emit(state.copyWith(status: CubitStatus.done, locale: Locale(language)));
  }

  Future<void> languageCode(String languageCode) async {
    emit(state.copyWith(status: CubitStatus.loading));

    AppSharedPreferences.cacheLanguageCode(languageCode: languageCode);

    emit(
        state.copyWith(status: CubitStatus.done, locale: Locale(languageCode)));
  }
}
