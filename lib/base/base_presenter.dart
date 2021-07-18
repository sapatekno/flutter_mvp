import 'package:flutter/material.dart';

abstract class BaseContract {
  /// TODO * This is Just Example, Feel Free To Remove
  void sampleBaseContractMethod(String message);
}

abstract class BasePresenter<Contract extends BaseContract> {
  late BuildContext context;
  late Contract view;

  void setContext(BuildContext context) => this.context = context;

  void setView(Contract view) => this.view = view;

  /// TODO * This is Just Example, Feel Free To Remove
  void sampleBasePresenterMethod() => view.sampleBaseContractMethod('This Message From Base Presenter Then Sent To View Via Base Contract.');

  /// TODO * This is Just Example, Feel Free To Remove
  void sampleBaseViewCallBasePresenter() {
    print("This Message Show On Logcat, this Method Called Via Base View.");
  }
}
