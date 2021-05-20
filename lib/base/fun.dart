import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_mvp/base/alias.dart';
import 'package:flutter_mvp/base/base_theme.dart';

class Fun {
  static String languageCodeToLanguageName({required BuildContext context, required String? languageCode}) {
    String _languageName = "";

    switch (languageCode) {
      case Alias.languageCodeEnglish:
        _languageName = AppLocalizations
            .of(context)
            ?.english ?? Alias.errorLanguage;
        break;
      case Alias.languageCodeIndonesia:
        _languageName = AppLocalizations
            .of(context)
            ?.indonesia ?? Alias.errorLanguage;
        break;
      default:
        _languageName = AppLocalizations
            .of(context)
            ?.system_default ?? Alias.errorLanguage;
        break;
    }
    return _languageName;
  }

  static ThemeData themeNameToThemeData({required String themeName}) {
    var _themeData = BaseTheme.themeLight();

    if (themeName.isNotEmpty) {
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
    } else {
      _themeData = BaseTheme.themeLight();
    }

    return _themeData;
  }
}
