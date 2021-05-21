import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_mvp/base/alias.dart';
import 'package:flutter_mvp/base/base_theme.dart';

class Fun {
  static String languageCodeToLanguageName({required BuildContext context, required String languageCode}) {
    String _languageName = Alias.emptyString;

    switch (languageCode) {
      case Alias.languageCodeEnglish:
        _languageName = AppLocalizations.of(context)?.english ?? Alias.errorLanguage;
        break;
      case Alias.languageCodeIndonesia:
        _languageName = AppLocalizations.of(context)?.indonesia ?? Alias.errorLanguage;
        break;
      default:
        _languageName = AppLocalizations.of(context)?.system_default ?? Alias.errorLanguage;
        break;
    }
    return _languageName;
  }

  static String themeNameToThemeLangName({required BuildContext context, required String themeName}) {
    String _themeLangName = Alias.emptyString;

    switch (themeName) {
      case Alias.light:
        _themeLangName = AppLocalizations.of(context)?.light ?? Alias.errorLanguage;
        break;
      case Alias.dark:
        _themeLangName = AppLocalizations.of(context)?.dark ?? Alias.errorLanguage;
        break;
      default:
        _themeLangName = AppLocalizations.of(context)?.light ?? Alias.errorLanguage;
        break;
    }

    return _themeLangName;
  }

  static ThemeData themeNameToThemeData({required String themeName}) {
    ThemeData _themeData = BaseTheme.themeLight();

    switch (themeName) {
      case Alias.light:
        _themeData = BaseTheme.themeLight();
        break;
      case Alias.dark:
        _themeData = BaseTheme.themeDark();
        break;
      default:
        _themeData = BaseTheme.themeLight();
        break;
    }

    return _themeData;
  }
}
