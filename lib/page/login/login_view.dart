import 'package:flutter/material.dart';
import 'package:flutter_mvp/base/base_stateful_widget.dart';
import 'package:flutter_mvp/base/base_theme.dart';
import 'package:flutter_mvp/data/model/ReqLogin.dart';
import 'package:flutter_mvp/page/login/login_presenter.dart';

class LoginView extends BaseStatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends BaseState<LoginView, LoginPresenter>
    implements LoginContract {
  final _keyScaffold = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  late LoginPresenter _presenter;

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
      title: Text("Flutter MVP"),
    );

    pageBody = LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewPortConstraint) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(
              BaseTheme.space(2),
            ),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: Column(
                children: [
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    autofillHints: [AutofillHints.email],
                    decoration: InputDecoration(labelText: "Email"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Data tidak boleh kosong";
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: TextFormField(
                      controller: _passwordController,
                      autofillHints: [AutofillHints.password],
                      decoration: InputDecoration(labelText: "Password"),
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Data tidak boleh kosong";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            child: Text("Login"),
                            style: TextButton.styleFrom(
                                primary: Colors.white,
                                backgroundColor: Colors.blue),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                var email = _emailController.text;
                                var password = _passwordController.text;
                                var request = ReqLogin(
                                  email: email,
                                  password: password,
                                );
                                _presenter.doLogin(request);
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
