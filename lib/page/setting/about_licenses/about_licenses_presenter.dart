import 'package:flutter_mvp/base/base_presenter.dart';
import 'package:package_info/package_info.dart';

abstract class AboutLicensesContract extends BaseContract {
  setPackageInfo({required PackageInfo packageInfo}) {}
}

class AboutLicensesPresenter extends BasePresenter<AboutLicensesContract> {
  getPackageInfo() async {
    final PackageInfo _pinfo = await PackageInfo.fromPlatform();
    view.setPackageInfo(packageInfo: _pinfo);
  }
}
