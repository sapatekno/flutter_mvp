import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_mvp/base/alias.dart';
import 'package:flutter_mvp/base/base_stateful_widget.dart';
import 'package:flutter_mvp/main.dart';
import 'package:flutter_mvp/page/setting/theme/theme_presenter.dart';
import 'package:settings_ui/settings_ui.dart';

class ThemeView extends BaseStatefulWidget {
  static const routeName = '/theme';

  @override
  _ThemeViewState createState() => _ThemeViewState();
}

class _ThemeViewState extends BaseState<ThemeView, ThemePresenter> implements ThemeContract {
  late ThemePresenter _presenter;
  int _themeIndex = 0;

  @override
  void initMVP() {
    _presenter = new ThemePresenter();
    _presenter.setView(this);

    initView();
  }

  initView() {
    _presenter.getSetting();
  }

  @override
  Widget build(BuildContext context) {
    pageAppBar = AppBar(title: Text(AppLocalizations
        .of(context)
        ?.select_theme ?? Alias.errorLanguage));
    pageBody = SettingsList(
      sections: [
        SettingsSection(tiles: [
          SettingsTile(
            title: AppLocalizations
                .of(context)
                ?.light ?? Alias.errorLanguage,
            trailing: trailingWidget(0),
            onPressed: (BuildContext context) {
              changeTheme(index: 0, themeName: Alias.light);
            },
          ),
          SettingsTile(
            title: AppLocalizations
                .of(context)
                ?.dark ?? Alias.errorLanguage,
            trailing: trailingWidget(1),
            onPressed: (BuildContext context) {
              changeTheme(index: 1, themeName: Alias.dark);
            },
          ),
        ]),
      ],
    );
    return super.build(context);
  }

  Widget trailingWidget(int index) {
    return (_themeIndex == index) ? Icon(Icons.check, color: Colors.blue) : Icon(null);
  }

  changeTheme({required int index, required String themeName}) {
    setState(() {
      _presenter.setTheme(themeName: themeName);
      _themeIndex = index;
    });
  }

  @override
  setSetting({String? themeName}) {
    switch (themeName) {
      case Alias.light:
        MainApp.setTheme(context, Alias.light);
        _themeIndex = 0;
        break;
      case Alias.dark:
        MainApp.setTheme(context, Alias.dark);
        _themeIndex = 1;
        break;
      default:
        MainApp.setTheme(context, Alias.light);
        _themeIndex = 0;
        break;
    }
  }

  @override
  loadTheme({required String themeName}) {
    MainApp.setTheme(context, themeName);
  }
}
