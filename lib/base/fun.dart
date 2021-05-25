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

  static String fontNameToFontLangName({required BuildContext context, required String fontName}) {
    String _fontLangName = Alias.emptyString;

    switch (fontName) {
      case Alias.roboto:
        _fontLangName = AppLocalizations.of(context)?.roboto ?? Alias.errorLanguage;
        break;
      case Alias.montserrat:
        _fontLangName = AppLocalizations.of(context)?.montserrat ?? Alias.errorLanguage;
        break;
      case Alias.open_sans:
        _fontLangName = AppLocalizations.of(context)?.open_sans ?? Alias.errorLanguage;
        break;
      case Alias.rubik:
        _fontLangName = AppLocalizations.of(context)?.rubik ?? Alias.errorLanguage;
        break;
      default:
        _fontLangName = AppLocalizations.of(context)?.system_default ?? Alias.errorLanguage;
        break;
    }

    return _fontLangName;
  }

  static double fontSizeToTextScaleFactor({required String fontSize}) {
    double _textScaleFactor = Alias.defaultTextScaleFactor;

    switch (fontSize) {
      case Alias.small:
        _textScaleFactor = 0.75;
        break;
      case Alias.normal:
        _textScaleFactor = 1;
        break;
      case Alias.large:
        _textScaleFactor = 1.25;
        break;
      case Alias.largest:
        _textScaleFactor = 1.5;
        break;
      default:
        _textScaleFactor = 1;
        break;
    }

    return _textScaleFactor;
  }

  static String fontSizeToFontSizeName({required BuildContext context, required String fontSize}) {
    String _fontSizeName = Alias.emptyString;

    switch (fontSize) {
      case Alias.small:
        _fontSizeName = AppLocalizations.of(context)?.small ?? Alias.errorLanguage;
        break;
      case Alias.normal:
        _fontSizeName = AppLocalizations.of(context)?.normal ?? Alias.errorLanguage;
        break;
      case Alias.large:
        _fontSizeName = AppLocalizations.of(context)?.large ?? Alias.errorLanguage;
        break;
      case Alias.largest:
        _fontSizeName = AppLocalizations.of(context)?.largest ?? Alias.errorLanguage;
        break;
      default:
        _fontSizeName = AppLocalizations.of(context)?.normal ?? Alias.errorLanguage;
        break;
    }

    return _fontSizeName;
  }
}
