import 'package:flutter/material.dart';
import 'package:flutter_mvp/base/alias.dart';
import 'package:flutter_mvp/base/base_stateful_widget.dart';
import 'package:flutter_mvp/page/setting/about_licenses/about_licenses_presenter.dart';
import 'package:package_info/package_info.dart';

class AboutlicensesView extends BaseStatefulWidget {
  static const routeName = '/about_licenses';

  @override
  _AboutlicensesViewState createState() => _AboutlicensesViewState();
}

class _AboutlicensesViewState extends BaseState<AboutlicensesView, AboutLicensesPresenter> implements AboutLicensesContract {
  late AboutLicensesPresenter _presenter;
  String _appLegalese = Alias.emptyString;
  String _appName = Alias.emptyString;
  String _appVersion = Alias.emptyString;

  @override
  void initMVP() {
    _presenter = new AboutLicensesPresenter();
    _presenter.setView(this);

    _initView();
  }

  @override
  Widget build(BuildContext context) {
    pageBody = LicensePage(
      applicationLegalese: _appLegalese,
      applicationIcon: null,
      applicationName: _appName,
      applicationVersion: _appVersion,
    );
    return super.build(context);
  }

  _initView() {
    _presenter.getPackageInfo();
  }

  @override
  setPackageInfo({required PackageInfo packageInfo}) {
    setState(() {
      _appLegalese = "Copyright © 2021 Hadian Alkani";
      _appName = packageInfo.appName;
      _appVersion = 'v' + packageInfo.version;
    });
  }
}
