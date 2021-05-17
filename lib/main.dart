import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mvp/base/base_theme.dart';
import 'package:flutter_mvp/page/login/login_view.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter MVP Basic Architecture',
      localizationsDelegates: _localeDelegates,
      locale: _locales.first,
      supportedLocales: _locales,
      theme: ThemeData(
        primarySwatch: BaseTheme.colorPrimary,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginView(),
    );
  }
}
