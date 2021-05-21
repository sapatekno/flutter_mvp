import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvp/base/base_stateful_widget.dart';
import 'package:flutter_mvp/data/database/database.dart';
import 'package:flutter_mvp/data/database/entity/category.dart';
import 'package:flutter_mvp/page/category/category_view.dart';
import 'package:flutter_mvp/page/init/init_presenter.dart';

class InitView extends BaseStatefulWidget {
  static const routeName = '/';

  @override
  _InitViewState createState() => _InitViewState();
}

class _InitViewState extends BaseState<InitView, InitPresenter>
    implements InitContract {
  late InitPresenter _presenter;

  @override
  void initMVP() {
    _presenter = new InitPresenter();
    _presenter.setView(this);

    _initDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return super.build(context);
  }

  _initDatabase() async {
    final callback = Callback(
      onCreate: (database, version) {
        print("Database Created");
      },
      onOpen: (database) {
        print("Database Opened");
      },
      onUpgrade: (database, startVersion, endVersion) {
        print("Database Upgraded");
      },
    );

    final database = await $FloorAppDatabase
        .databaseBuilder(AppDatabase.dbName)
        .addCallback(callback)
        .build();

    var category = Category(null, "Hola");
    await database.categoryDao.insertCategory(category);

    database.close();

    _openApp();
  }

  _openApp() {
    Navigator.pushNamed(context, CategoryView.routeName);
  }
}
