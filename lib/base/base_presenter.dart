import 'package:flutter/material.dart';

abstract class BaseContract {}

abstract class BasePresenter<Contract extends BaseContract> {
  late Contract view;
  late BuildContext context;

  void setView(Contract view) {
    this.view = view;
  }

  void setContext(BuildContext context) {
    this.context = context;
  }

  void call() {
    print("bomba bomba");
  }
}
