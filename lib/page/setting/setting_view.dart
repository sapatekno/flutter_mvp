import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_mvp/base/alias.dart';
import 'package:flutter_mvp/base/base_stateful_widget.dart';
import 'package:flutter_mvp/base/base_theme.dart';
import 'package:flutter_mvp/base/fun.dart';
import 'package:flutter_mvp/main.dart';
import 'package:flutter_mvp/page/setting/accent_color/accent_color_view.dart';
import 'package:flutter_mvp/page/setting/language/language_view.dart';
import 'package:flutter_mvp/page/setting/setting_presenter.dart';
import 'package:flutter_mvp/page/setting/theme/theme_view.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingView extends BaseStatefulWidget {
  static const routeName = '/settings';

  @override
  _SettingViewState createState() => _SettingViewState();
}

class _SettingViewState extends BaseState<SettingView, SettingPresenter> implements SettingContract {
  late SettingPresenter _presenter;
  String _accentColorName = Alias.emptyString;
  String _languageName = Alias.emptyString;
  String _themeName = Alias.emptyString;

  @override
  void initMVP() {
    _presenter = new SettingPresenter();
    _presenter.setView(this);

    _initView();
  }

  @override
  Widget build(BuildContext context) {
    pageAppBar = AppBar(title: Text(AppLocalizations.of(context)?.settings ?? Alias.errorLanguage));

    pageBody = SettingsList(
      sections: [
        SettingsSection(
          title: AppLocalizations.of(context)?.appearance ?? Alias.errorLanguage,
          titlePadding: EdgeInsets.all(BaseTheme.space(4)),
          tiles: [
            SettingsTile(
              title: AppLocalizations.of(context)?.language ?? Alias.errorLanguage,
              subtitle: _languageName,
              leading: Icon(
                Icons.language,
                color: MainApp.getAccentColor(context),
              ),
              onPressed: (BuildContext context) {
                Navigator.pushNamed(context, LanguageView.routeName).then((value) => _initView());
              },
            ),
            SettingsTile(
              title: AppLocalizations.of(context)?.theme ?? Alias.errorLanguage,
              subtitle: _themeName,
              leading: Icon(
                Icons.brightness_4,
                color: MainApp.getAccentColor(context),
              ),
              onPressed: (BuildContext context) {
                Navigator.pushNamed(context, ThemeView.routeName).then((value) => _initView());
              },
            ),
            SettingsTile(
              title: AppLocalizations.of(context)?.accent_color ?? Alias.errorLanguage,
              subtitle: _accentColorName,
              leading: Icon(
                Icons.circle,
                color: MainApp.getAccentColor(context),
              ),
              onPressed: (BuildContext context) {
                Navigator.pushNamed(context, AccentColorView.routeName).then((value) => _initView());
              },
            ),
            SettingsTile(
              title: AppLocalizations.of(context)?.font ?? Alias.errorLanguage,
              subtitle: 'Roboto',
              leading: Icon(
                Icons.font_download,
                color: MainApp.getAccentColor(context),
              ),
              onPressed: (BuildContext context) {
                Navigator.pushNamed(context, LanguageView.routeName);
              },
            ),
            SettingsTile(
              title: AppLocalizations.of(context)?.font_size ?? Alias.errorLanguage,
              subtitle: 'Normal',
              leading: Icon(
                Icons.text_fields,
                color: MainApp.getAccentColor(context),
              ),
              onPressed: (BuildContext context) {
                Navigator.pushNamed(context, LanguageView.routeName);
              },
            ),
          ],
        ),
        SettingsSection(
          title: AppLocalizations.of(context)?.other ?? Alias.errorLanguage,
          titlePadding: EdgeInsets.all(BaseTheme.space(4)),
          tiles: [
            SettingsTile(
              title: AppLocalizations.of(context)?.about_and_licenses ?? Alias.errorLanguage,
              subtitle: 'v1.0.0',
              leading: Icon(
                Icons.info,
                color: MainApp.getAccentColor(context),
              ),
              onPressed: (BuildContext context) {
                Navigator.pushNamed(context, LanguageView.routeName);
              },
            ),
          ],
        ),
      ],
    );

    return super.build(context);
  }

  @override
  setLanguageCode({required String languageCode}) {
    setState(() {
      _languageName = Fun.languageCodeToLanguageName(context: context, languageCode: languageCode);
    });
  }

  setThemeName({required String themeName}) {
    setState(() {
      _themeName = Fun.themeNameToThemeLangName(context: context, themeName: themeName);
    });
  }

  _initView() {
    _presenter.getConfig();
  }

  @override
  setAccentColorName({required String accentColorName}) {
    setState(() {
      _accentColorName = Fun.accentColorNameToAccentColorLangName(context: context, accentColorName: accentColorName);
    });
  }
}
