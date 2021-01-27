import 'package:flutter/material.dart';
import 'package:flutter_mvp/base/base_theme.dart';
import 'package:flutter_mvp/page/login/login_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter MVP Basic Architecture',
      theme: ThemeData(
        primarySwatch: BaseTheme.colorPrimary,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginView(),
    );
  }
}
