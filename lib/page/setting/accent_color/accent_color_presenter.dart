import 'package:flutter_mvp/base/alias.dart';
import 'package:flutter_mvp/base/base_presenter.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AccentColorContract extends BaseContract {
  setSetting({required String accentColorName});

  loadAccentColor({required String colorName}) {}
}

class AccentColorPresenter extends BasePresenter<AccentColorContract> {
  getSetting() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    final String _accentColorName = _prefs.getString(Alias.keySettingAccentColorName) ?? Alias.emptyString;
    view.setSetting(accentColorName: _accentColorName);
  }

  setAccentColor({required String colorName}) async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.setString(Alias.keySettingAccentColorName, colorName);
    view.loadAccentColor(colorName: colorName);
  }
}
