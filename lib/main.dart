import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mvp/base/alias.dart';
import 'package:flutter_mvp/base/base_theme.dart';
import 'package:flutter_mvp/base/fun.dart';
import 'package:flutter_mvp/page/category/category_view.dart';
import 'package:flutter_mvp/page/init/Init_view.dart';
import 'package:flutter_mvp/page/setting/language/language_view.dart';
import 'package:flutter_mvp/page/setting/setting_view.dart';
import 'package:flutter_mvp/page/setting/theme/theme_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();

  static void setLocale(BuildContext context, Locale? locale) {
    _MainAppState _state = context.findAncestorStateOfType<_MainAppState>() as _MainAppState;
    _state.setLocale(locale);
  }

  static void setTheme(BuildContext context, String themeName) {
    _MainAppState _state = context.findAncestorStateOfType<_MainAppState>() as _MainAppState;
    _state.setTheme(themeName);
  }
}

class _MainAppState extends State<MainApp> {
  ThemeData _themeData = BaseTheme.themeLight();
  Locale? _locale;

  final _locales = [
    Locale('id'), // * Bahasa Indonesia
    Locale('en'), // * English
  ];

  final _localeDelegates = [
    AppLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  final _routes = {
    InitView.routeName: (context) => InitView(),
    CategoryView.routeName: (context) => CategoryView(),
    SettingView.routeName: (context) => SettingView(),
    LanguageView.routeName: (context) => LanguageView(),
    ThemeView.routeName: (context) => ThemeView(),
  };

  @override
  initState() {
    super.initState();
    initView();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Alias.appTitle,
      localizationsDelegates: _localeDelegates,
      locale: _locale,
      supportedLocales: _locales,
      initialRoute: InitView.routeName,
      routes: _routes,
      theme: _themeData,
    );
  }

  setLocale(Locale? locale) {
    setState(() {
      _locale = locale;
    });
  }

  setTheme(String? themeName) {
    setState(() {
      _themeData = Fun.themeNameToThemeData(themeName: themeName ?? Alias.emptyString);
    });
  }

  initView() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();

    /// * Check Language
    final String? _languageCode = _prefs.getString(Alias.keySettingLanguageCode);

    if (_languageCode != null || _languageCode!.isNotEmpty) {
      _locale = Locale(_languageCode);
    } else {
      _locale = null;
    }

    /// * Check Theme
    final String? _themeName = _prefs.getString(Alias.keySettingTheme);

    _themeData = Fun.themeNameToThemeData(themeName: _themeName ?? Alias.emptyString);
  }
}
