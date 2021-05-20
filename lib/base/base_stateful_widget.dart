import 'package:flutter/material.dart';
import 'package:flutter_mvp/base/base_presenter.dart';

abstract class BaseStatefulWidget extends StatefulWidget {}

abstract class BaseState<StatefulWidget extends BaseStatefulWidget,
        Presenter extends BasePresenter> extends State<StatefulWidget>
    with WidgetsBindingObserver
    implements BaseContract {
  bool isLoading = false;

  GlobalKey<ScaffoldState>? keyScaffold;

  AppBar? pageAppBar;
  Widget? pageBody;

  void initMVP();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
    initMVP();
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance!.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: keyScaffold,
        appBar: pageAppBar,
        body: isLoading
            ? Container(
          child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : pageBody,
      ),
    );
  }

  void showSnackBar({
    required String message,
  }) {
    final snackBar = SnackBar(
      content: Text(message),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  void showPageLoading(bool isLoading) {
    setState(() {
      this.isLoading = isLoading;
    });
  }
}
