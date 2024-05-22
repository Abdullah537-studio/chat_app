import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalization {
  final Locale? locale;

  AppLocalization({required this.locale});

  static AppLocalization? of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }

  static LocalizationsDelegate<AppLocalization> delegate =
      _AppLocalizationsDelegate();
  late Map<String, String> _localizedStrings;
  Future loadJsonLanguage() async {
    String jsonString = await rootBundle.loadString(
        "lib/generate/app_localizations/lang/${locale!.languageCode}.json");
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings = jsonMap.map(
      (key, value) => MapEntry(key, value.toString()),
    );
  }

  String translate(String key) => _localizedStrings[key] ?? "";
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalization> {
  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalization> load(Locale locale) async {
    AppLocalization localization = AppLocalization(locale: locale);
    await localization.loadJsonLanguage();
    return localization;
  }

//! هاد مشان  يعيد تحميل البيانات عند كل تغيير
  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalization> old) =>
      false;
}
