import 'package:flutter/material.dart';
import 'package:flutter_mvp/data/database/database.dart';

abstract class BaseContract {
  void showPageLoading(bool isStatus);
}

abstract class BasePresenter<Contract extends BaseContract> {
  @protected
  late Contract view;

  Future<AppDatabase> loadDatabase() async {
    return await $FloorAppDatabase.databaseBuilder(AppDatabase.dbName).build();
  }

  void setView(Contract view) {
    this.view = view;
  }
}
