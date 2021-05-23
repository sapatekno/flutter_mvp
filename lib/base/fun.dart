import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_mvp/base/alias.dart';

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

  static Brightness themeNameToThemeMode({required String themeName}) {
    Brightness _themeMode = Brightness.light;

    switch (themeName) {
      case Alias.light:
        _themeMode = Brightness.light;
        break;
      case Alias.dark:
        _themeMode = Brightness.dark;
        break;
      default:
        _themeMode = Brightness.light;
        break;
    }

    return _themeMode;
  }

  static String accentColorNameToAccentColorLangName({required BuildContext context, required String accentColorName}) {
    String _accentColorLangName = Alias.emptyString;

    switch (accentColorName) {
      case Alias.blue:
        _accentColorLangName = AppLocalizations.of(context)?.blue ?? Alias.errorLanguage;
        break;
      case Alias.red:
        _accentColorLangName = AppLocalizations.of(context)?.red ?? Alias.errorLanguage;
        break;
      case Alias.teal:
        _accentColorLangName = AppLocalizations.of(context)?.teal ?? Alias.errorLanguage;
        break;
      default:
        _accentColorLangName = AppLocalizations.of(context)?.blue ?? Alias.errorLanguage;
        break;
    }

    return _accentColorLangName;
  }
}
