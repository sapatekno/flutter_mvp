import 'package:flutter/material.dart';
import 'package:flutter_mvp/base/base_config.dart';
import 'package:flutter_mvp/page/sample/sample_view.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: BaseConfig.APP_NAME,
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SampleView(),
      );
}
