import 'package:flutter_mvp/base/base_presenter.dart';

abstract class LoginContract extends BaseContract {
  void setData();
}

class LoginPresenter extends BasePresenter<LoginContract> {
  void getInfo() {
    print("this is getInfo");
  }

  void task() {
    print("task di click");
    view.showPageLoading(true);
  }
}
