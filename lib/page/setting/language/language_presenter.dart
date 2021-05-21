import 'package:flutter_mvp/base/alias.dart';
import 'package:flutter_mvp/base/base_presenter.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LanguageContract extends BaseContract {
  setSetting({required String languageCode});

  loadLanguage({required String languageCode});
}

class LanguagePresenter extends BasePresenter<LanguageContract> {
  getSetting() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    final String _languageCode = _prefs.getString(Alias.keySettingLanguageCode) ?? Alias.emptyString;
    view.setSetting(languageCode: _languageCode);
  }

  setLanguage({required String languageCode}) async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.setString(Alias.keySettingLanguageCode, languageCode);

    view.loadLanguage(languageCode: languageCode);
  }
}
