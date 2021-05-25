import 'package:flutter_mvp/base/alias.dart';
import 'package:flutter_mvp/base/base_presenter.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SettingContract extends BaseContract {
  setLanguageCode({required String languageCode});

  setThemeName({required String themeName});

  setAccentColorName({required String accentColorName});

  setFontName({required String fontName});

  setFontSize({required String fontSize});

  setVersion({required String appVersion});
}

class SettingPresenter extends BasePresenter<SettingContract> {
  getConfig() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    final PackageInfo _pinfo = await PackageInfo.fromPlatform();

    final String _languageCode = _prefs.getString(Alias.keySettingLanguageCode) ?? Alias.emptyString;
    view.setLanguageCode(languageCode: _languageCode);

    final String _themeName = _prefs.getString(Alias.keySettingThemeName) ?? Alias.emptyString;
    view.setThemeName(themeName: _themeName);

    final String _accentColorName = _prefs.getString(Alias.keySettingAccentColorName) ?? Alias.emptyString;
    view.setAccentColorName(accentColorName: _accentColorName);

    final String _fontName = _prefs.getString(Alias.keySettingFontName) ?? Alias.emptyString;
    view.setFontName(fontName: _fontName);

    final String _fontSize = _prefs.getString(Alias.keySettingFontSize) ?? Alias.emptyString;
    view.setFontSize(fontSize: _fontSize);

    final String _appVersion = _pinfo.version;
    view.setVersion(appVersion: _appVersion);
  }
}
