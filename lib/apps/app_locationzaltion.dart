import 'dart:convert';
import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();
  late Map<String, String> _localizedValues; // Using 'late' modifier

  Future<bool> load() async {
    String jsonString = await rootBundle.loadString('lib/lang/en.json');
    String assetPath = 'assets/lang/${locale.languageCode}.json';
    log('Asset Path: $assetPath');
    Map<String, dynamic> loadedData = json.decode(jsonString);
    _localizedValues =
        loadedData.map((key, value) => MapEntry(key, value.toString()));

    return true;
  }

  String getTranslatedValue(String key) {
    return _localizedValues[key]!;
  }
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();
  bool isSupported(Locale locale) {
    return ['en', 'ar', 'hi'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
