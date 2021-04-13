import 'package:flutter/material.dart';

abstract class BaseContract {
  void showPageLoading(bool isStatus);
}

abstract class BasePresenter<Contract extends BaseContract> {
  @protected
  late Contract view;

  void setView(Contract view) {
    this.view = view;
  }
}
