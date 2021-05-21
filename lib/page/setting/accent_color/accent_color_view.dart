import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_mvp/base/alias.dart';
import 'package:flutter_mvp/base/base_stateful_widget.dart';
import 'package:flutter_mvp/main.dart';
import 'package:flutter_mvp/page/setting/accent_color/accent_color_presenter.dart';
import 'package:settings_ui/settings_ui.dart';

class AccentColorView extends BaseStatefulWidget {
  static const routeName = '/accent_color';

  @override
  _AccentColorViewState createState() => _AccentColorViewState();
}

class _AccentColorViewState extends BaseState<AccentColorView, AccentColorPresenter> implements AccentColorContract {
  late AccentColorPresenter _presenter;
  int _accentColorIndex = 0;

  @override
  void initMVP() {
    _presenter = new AccentColorPresenter();
    _presenter.setView(this);

    _initView();
  }

  _initView() {
    _presenter.getSetting();
  }

  @override
  Widget build(BuildContext context) {
    pageAppBar = AppBar(title: Text(AppLocalizations.of(context)?.select_theme ?? Alias.errorLanguage));
    pageBody = SettingsList(
      sections: [
        SettingsSection(tiles: [
          SettingsTile(
            title: AppLocalizations.of(context)?.blue ?? Alias.errorLanguage,
            trailing: trailingWidget(0),
            onPressed: (BuildContext context) {
              changeTheme(index: 0, colorName: Alias.blue);
            },
          ),
          SettingsTile(
            title: AppLocalizations.of(context)?.red ?? Alias.errorLanguage,
            trailing: trailingWidget(1),
            onPressed: (BuildContext context) {
              changeTheme(index: 1, colorName: Alias.red);
            },
          ),
          SettingsTile(
            title: AppLocalizations.of(context)?.teal ?? Alias.errorLanguage,
            trailing: trailingWidget(2),
            onPressed: (BuildContext context) {
              changeTheme(index: 2, colorName: Alias.teal);
            },
          ),
        ]),
      ],
    );
    return super.build(context);
  }

  Widget trailingWidget(int index) {
    return (_accentColorIndex == index) ? Icon(Icons.check, color: MainApp.getAccentColor(context)) : Icon(null);
  }

  changeTheme({required int index, required String colorName}) {
    setState(() {
      _presenter.setAccentColor(colorName: colorName);
      _accentColorIndex = index;
    });
  }

  @override
  setSetting({required String accentColorName}) {
    setState(() {
      switch (accentColorName) {
        case Alias.blue:
          _accentColorIndex = 0;
          break;
        case Alias.red:
          _accentColorIndex = 1;
          break;
        case Alias.teal:
          _accentColorIndex = 2;
          break;
        default:
          _accentColorIndex = 0;
          break;
      }
    });
  }

  @override
  loadAccentColor({required String colorName}) {
    MainApp.setAccentColor(context, colorName);
  }
}
