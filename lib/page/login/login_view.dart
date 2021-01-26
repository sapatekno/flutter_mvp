import 'package:flutter/material.dart';
import 'package:flutter_mvp/base/base_stateful_widget.dart';
import 'package:flutter_mvp/base/base_theme.dart';
import 'package:flutter_mvp/page/login/login_presenter.dart';

class LoginView extends BaseStatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends BaseState<LoginView, LoginPresenter>
    implements LoginContract {
  final _keyScaffold = GlobalKey<ScaffoldState>();

  LoginPresenter _presenter;

  String text = "coba";

  @override
  void initMVP() {
    _presenter = new LoginPresenter();
    _presenter.setView(this);

    _presenter.getInfo();
  }

  @override
  Widget build(BuildContext context) {
    keyScaffold = _keyScaffold;

    pageAppBar = AppBar(
      title: Text("Hola"),
    );

    pageBody = LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewPortConstraint) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(
              BaseTheme.space(2),
            ),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: "Email"),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Email"),
                ),
                Row(
                  children: [
                    Expanded(
                      child: FlatButton(
                        child: Text("Reset"),
                      ),
                    ),
                    Expanded(
                      child: FlatButton(
                        child: Text("Login"),
                        color: Colors.blue,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );

    return super.build(context);
  }

  @override
  void setData() {
    print("set data is called");
  }
}
