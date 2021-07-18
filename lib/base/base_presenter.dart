import 'package:flutter/material.dart';

abstract class BaseContract {}

abstract class BasePresenter<Contract extends BaseContract> {
  late BuildContext context;
  late Contract view;

  void setContext(BuildContext context) => this.context = context;

  void setView(Contract view) => this.view = view;
}
