import 'package:flutter/material.dart';
import 'package:flutter_mvp/base/base_stateful_widget.dart';
import 'package:flutter_mvp/page/login/login_presenter.dart';

class LoginView extends BaseStatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends BaseState<LoginView, LoginPresenter> implements LoginContract {
  @override
  void initState() {
    super.initState();
    onInitState(context: context, presenter: LoginPresenter(), view: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Text('text'),
      ),
    );
  }

  @override
  void onViewCreated() {}
}
