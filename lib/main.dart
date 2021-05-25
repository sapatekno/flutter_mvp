import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mvp/base/alias.dart';
import 'package:flutter_mvp/base/fun.dart';
import 'package:flutter_mvp/page/category/category_view.dart';
import 'package:flutter_mvp/page/home/home_view.dart';
import 'package:flutter_mvp/page/init/Init_view.dart';
import 'package:flutter_mvp/page/setting/about_licenses/about_licenses_view.dart';
import 'package:flutter_mvp/page/setting/accent_color/accent_color_view.dart';
import 'package:flutter_mvp/page/setting/font/font_view.dart';
import 'package:flutter_mvp/page/setting/font_size/font_size_view.dart';
import 'package:flutter_mvp/page/setting/language/language_view.dart';
import 'package:flutter_mvp/page/setting/setting_view.dart';
import 'package:flutter_mvp/page/setting/theme/theme_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  LicenseRegistry.addLicense(() async* {
    final licenseOFL = await rootBundle.loadString('google_fonts/LICENSE.txt');
    final licenseApache = await rootBundle.loadString('google_fonts/OFL.txt');

    yield LicenseEntryWithLineBreaks(['Open Sans'], licenseApache);
    yield LicenseEntryWithLineBreaks(['Montserrat'], licenseOFL);
  });

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
    _state._setAccentColor(accentColorName: accentColorName);
  }

  static void setLocale(BuildContext context, Locale? locale) {
    _MainAppState _state = context.findAncestorStateOfType<_MainAppState>() as _MainAppState;
    _state._setLocale(locale: locale);
  }

  static void setTheme(BuildContext context, String themeName) {
    _MainAppState _state = context.findAncestorStateOfType<_MainAppState>() as _MainAppState;
    _state._setTheme(themeName: themeName);
  }

  static void setFontName(BuildContext context, String fontName) {
    _MainAppState _state = context.findAncestorStateOfType<_MainAppState>() as _MainAppState;
    _state._setFontName(fontName: fontName);
  }

  static void setFontSize(BuildContext context, String fontSize) {
    _MainAppState _state = context.findAncestorStateOfType<_MainAppState>() as _MainAppState;
    _state._setFontSize(fontSize: fontSize);
  }
}

class _MainAppState extends State<MainApp> {
  Brightness _themeMode = Brightness.light;

  MaterialColor _primarySwatch = Colors.blue;
  Color? _accentColor = Colors.blue[500];
  Color? _toggleableActiveColor = Colors.blue[500];
  Color? _selectionColor = Colors.blue[500];

  TextStyle? _textStyle;
  TextTheme? _textTheme;
  double _textScaleFactor = Alias.defaultTextScaleFactor;

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
    FontView.routeName: (context) => FontView(),
    FontSizeView.routeName: (context) => FontSizeView(),
    AboutlicensesView.routeName: (context) => AboutlicensesView(),
    HomeView.routeName: (context) => HomeView(),
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
              textScaleFactor: data.textScaleFactor * _textScaleFactor,
            ),
            child: child as Widget);
      },
      initialRoute: InitView.routeName,
      locale: _locale,
      localizationsDelegates: _localeDelegates,
      theme: ThemeData(
        tabBarTheme: TabBarTheme(
          labelStyle: _textStyle,
        ),
        appBarTheme: AppBarTheme(
          textTheme: TextTheme(
            headline6: _textStyle,
          ),
        ),
        brightness: _themeMode,
        primarySwatch: _primarySwatch,
        accentColor: _accentColor,
        toggleableActiveColor: _toggleableActiveColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: _textTheme,
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: _selectionColor,
        ),
      ),
      title: Alias.appTitle,
      routes: _routes,
      supportedLocales: _locales,
    );
  }

  _setLocale({Locale? locale}) {
    setState(() {
      _locale = locale;
    });
  }

  _setTheme({required String themeName}) async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    final String _fontName = _prefs.getString(Alias.keySettingFontName) ?? Alias.emptyString;

    setState(() {
      _themeMode = Fun.themeNameToThemeMode(themeName: themeName);
      _setFontName(fontName: _fontName);
    });
  }

  _setAccentColor({required String accentColorName}) {
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

  _setFontName({required String fontName}) {
    setState(() {
      switch (fontName) {
        case Alias.roboto:
          _textStyle = GoogleFonts.roboto();
          _textTheme = GoogleFonts.robotoTextTheme(ThemeData(brightness: _themeMode, textTheme: TextTheme()).textTheme);
          break;
        case Alias.montserrat:
          _textStyle = GoogleFonts.montserrat();
          _textTheme = GoogleFonts.montserratTextTheme(ThemeData(brightness: _themeMode, textTheme: TextTheme()).textTheme);
          break;
        case Alias.open_sans:
          _textStyle = GoogleFonts.openSans();
          _textTheme = GoogleFonts.openSansTextTheme(ThemeData(brightness: _themeMode, textTheme: TextTheme()).textTheme);
          break;
        case Alias.rubik:
          _textStyle = GoogleFonts.rubik();
          _textTheme = GoogleFonts.rubikTextTheme(ThemeData(brightness: _themeMode, textTheme: TextTheme()).textTheme);
          break;
        default:
          _textStyle = null;
          _textTheme = null;
          break;
      }
    });
  }

  _setFontSize({required String fontSize}) {
    setState(() {
      _textScaleFactor = Fun.fontSizeToTextScaleFactor(fontSize: fontSize);
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

    /// * Check Font Name
    final String _fontName = _prefs.getString(Alias.keySettingFontName) ?? Alias.emptyString;

    /// * Check Font Size
    final String _fontSize = _prefs.getString(Alias.keySettingFontSize) ?? Alias.emptyString;

    /// * Set Settings at First Load
    _setLocale(locale: _locale);
    _setTheme(themeName: _themeName);
    _setAccentColor(accentColorName: _accentColorName);
    _setFontName(fontName: _fontName);
    _setFontSize(fontSize: _fontSize);
  }
}
