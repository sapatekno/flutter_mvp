import 'package:flutter/material.dart';
import 'package:flutter_mvp/base/base_presenter.dart';

abstract class BaseStatefulWidget extends StatefulWidget {
  const BaseStatefulWidget({Key? key}) : super(key: key);
}

abstract class BaseState<StatefulWidget extends BaseStatefulWidget, Presenter extends BasePresenter> extends State<StatefulWidget> implements BaseContract {
  late Presenter presenter;

  void onInitState({required BuildContext context, required Presenter presenter, required BaseState view}) {
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      this.presenter = presenter;
      this.presenter.setContext(context);
      this.presenter.setView(view);
      onViewCreated();

      /// TODO * This is Just Example, Feel Free To Remove
      presenter.sampleBaseViewCallBasePresenter();
    });
  }

  void onViewCreated();
}
