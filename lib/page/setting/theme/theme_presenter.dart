import 'package:flutter_mvp/base/alias.dart';
import 'package:flutter_mvp/base/base_presenter.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ThemeContract extends BaseContract {
  setSetting({String? themeName});

  loadTheme({required String themeName});
}

class ThemePresenter extends BasePresenter<ThemeContract> {
  getSetting() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    final String? _themeName = _prefs.getString(Alias.keySettingTheme);
    view.setSetting(themeName: _themeName);
  }

  setTheme({required String themeName}) async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.setString(Alias.keySettingTheme, themeName);

    view.loadTheme(themeName: themeName);
  }
}
