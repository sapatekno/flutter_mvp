import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mvp/base/alias.dart';
import 'package:flutter_mvp/base/fun.dart';
import 'package:flutter_mvp/page/category/category_view.dart';
import 'package:flutter_mvp/page/init/Init_view.dart';
import 'package:flutter_mvp/page/setting/accent_color/accent_color_view.dart';
import 'package:flutter_mvp/page/setting/language/language_view.dart';
import 'package:flutter_mvp/page/setting/setting_view.dart';
import 'package:flutter_mvp/page/setting/theme/theme_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();

  static MaterialColor getAccentColor(BuildContext context) {
    _MainAppState _state = context.findAncestorStateOfType<_MainAppState>() as _MainAppState;
    return _state._getAccentColor();
  }

  static void setAccentColor(BuildContext context, String accentColorName) {
    _MainAppState _state = context.findAncestorStateOfType<_MainAppState>() as _MainAppState;
    _state._setAccentColor(accentColorName);
  }

  static void setLocale(BuildContext context, Locale? locale) {
    _MainAppState _state = context.findAncestorStateOfType<_MainAppState>() as _MainAppState;
    _state._setLocale(locale);
  }

  static void setTheme(BuildContext context, String themeName) {
    _MainAppState _state = context.findAncestorStateOfType<_MainAppState>() as _MainAppState;
    _state._setTheme(themeName);
  }
}

class _MainAppState extends State<MainApp> {
  Brightness _themeMode = Brightness.light;

  MaterialColor _primarySwatch = Colors.blue;
  Color? _accentColor = Colors.blue[500];
  Color? _toggleableActiveColor = Colors.blue[500];
  Color? _selectionColor = Colors.blue[500];

  Locale? _locale;

  final _locales = [
    Locale('en'), // * English
    Locale('id'), // * Bahasa Indonesia
  ];

  final _localeDelegates = [
    AppLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  final _routes = {
    AccentColorView.routeName: (context) => AccentColorView(),
    InitView.routeName: (context) => InitView(),
    CategoryView.routeName: (context) => CategoryView(),
    SettingView.routeName: (context) => SettingView(),
    LanguageView.routeName: (context) => LanguageView(),
    ThemeView.routeName: (context) => ThemeView(),
  };

  @override
  initState() {
    super.initState();
    _initView();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (BuildContext context, Widget? child) {
        final MediaQueryData data = MediaQuery.of(context);
        return MediaQuery(
            data: data.copyWith(
              textScaleFactor: data.textScaleFactor * MediaQuery.of(context).textScaleFactor,
            ),
            child: child as Widget);
      },
      initialRoute: InitView.routeName,
      locale: _locale,
      localizationsDelegates: _localeDelegates,
      theme: ThemeData(
        tabBarTheme: TabBarTheme(labelStyle: GoogleFonts.rubik()),
        appBarTheme: AppBarTheme(textTheme: TextTheme(headline6: GoogleFonts.rubik())),
        brightness: _themeMode,
        primarySwatch: _primarySwatch,
        accentColor: _accentColor,
        toggleableActiveColor: _toggleableActiveColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.rubikTextTheme(ThemeData(brightness: _themeMode, textTheme: TextTheme()).textTheme),
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: _selectionColor,
        ),
      ),
      title: Alias.appTitle,
      routes: _routes,
      supportedLocales: _locales,
    );
  }

  _setLocale(Locale? locale) {
    setState(() {
      _locale = locale;
    });
  }

  _setTheme(String themeName) {
    setState(() {
      _themeMode = Fun.themeNameToThemeMode(themeName: themeName);
    });
  }

  _setAccentColor(String accentColorName) {
    setState(() {
      switch (accentColorName) {
        case Alias.blue:
          _primarySwatch = Colors.blue;
          _accentColor = Colors.blue[500];
          _toggleableActiveColor = Colors.blue[500];
          _selectionColor = Colors.blue[500];
          break;
        case Alias.red:
          _primarySwatch = Colors.red;
          _accentColor = Colors.red[500];
          _toggleableActiveColor = Colors.red[500];
          _selectionColor = Colors.red[500];
          break;
        case Alias.teal:
          _primarySwatch = Colors.teal;
          _accentColor = Colors.teal[500];
          _toggleableActiveColor = Colors.teal[500];
          _selectionColor = Colors.teal[500];
          break;
        default:
          _primarySwatch = Colors.blue;
          _accentColor = Colors.blue[500];
          _toggleableActiveColor = Colors.blue[500];
          _selectionColor = Colors.blue[500];
          break;
      }
    });
  }

  MaterialColor _getAccentColor() {
    return _primarySwatch;
  }

  _initView() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();

    /// * Check Language
    final String _languageCode = _prefs.getString(Alias.keySettingLanguageCode) ?? Alias.emptyString;
    if (_languageCode.isNotEmpty) {
      _locale = Locale(_languageCode);
    } else {
      _locale = null;
    }

    /// * Check Theme
    final String _themeName = _prefs.getString(Alias.keySettingThemeName) ?? Alias.emptyString;

    /// * Check Accent Color
    final String _accentColorName = _prefs.getString(Alias.keySettingAccentColorName) ?? Alias.emptyString;

    /// * Set Settings at First Load
    _setLocale(_locale);
    _setTheme(_themeName);
    _setAccentColor(_accentColorName);
  }
}
