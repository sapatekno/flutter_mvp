import 'package:flutter_mvp/base/alias.dart';
import 'package:flutter_mvp/base/base_presenter.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class FontContract extends BaseContract {
  setSetting({required String fontName});

  loadFont({required String fontName});
}

class FontPresenter extends BasePresenter<FontContract> {
  getSetting() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    final String _fontName = _prefs.getString(Alias.keySettingFontName) ?? Alias.emptyString;
    view.setSetting(fontName: _fontName);
  }

  setFont({required String fontName}) async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.setString(Alias.keySettingFontName, fontName);

    view.loadFont(fontName: fontName);
  }
}
