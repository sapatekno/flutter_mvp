import 'package:flutter_mvp/base/alias.dart';
import 'package:flutter_mvp/base/base_presenter.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class FontSizeContract extends BaseContract {
  setSetting({required String fontSize});

  loadFontSize({required String fontSize});
}

class FontSizePresenter extends BasePresenter<FontSizeContract> {
  getSetting() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    final String _fontSize = _prefs.getString(Alias.keySettingFontSize) ?? Alias.emptyString;
    view.setSetting(fontSize: _fontSize);
  }

  setFontSize({required String fontSize}) async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.setString(Alias.keySettingFontSize, fontSize);

    view.loadFontSize(fontSize: fontSize);
  }
}
