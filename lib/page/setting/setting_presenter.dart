import 'package:flutter_mvp/base/alias.dart';
import 'package:flutter_mvp/base/base_presenter.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SettingContract extends BaseContract {
  setLanguageCode({required String languageCode});

  setThemeName({required String themeName});
}

class SettingPresenter extends BasePresenter<SettingContract> {
  getConfig() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();

    final String _languageCode = _prefs.getString(Alias.keySettingLanguageCode) ?? Alias.emptyString;
    view.setLanguageCode(languageCode: _languageCode);

    final String _themeName = _prefs.getString(Alias.keySettingThemeName) ?? Alias.emptyString;
    view.setThemeName(themeName: _themeName);
  }
}
