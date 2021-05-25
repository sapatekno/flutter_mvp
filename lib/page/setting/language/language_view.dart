import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_mvp/base/alias.dart';
import 'package:flutter_mvp/base/base_stateful_widget.dart';
import 'package:flutter_mvp/main.dart';
import 'package:flutter_mvp/page/setting/language/language_presenter.dart';
import 'package:settings_ui/settings_ui.dart';

class LanguageView extends BaseStatefulWidget {
  static const routeName = '/language';

  @override
  _LanguageViewState createState() => _LanguageViewState();
}

class _LanguageViewState extends BaseState<LanguageView, LanguagePresenter> implements LanguageContract {
  late LanguagePresenter _presenter;
  int _languageIndex = 0;

  @override
  void initState() {
    super.initState();
    _presenter = new LanguagePresenter();
    _presenter.setView(this);

    _initView();
  }

  _initView() {
    _presenter.getSetting();
  }

  @override
  Widget build(BuildContext context) {
    pageAppBar = AppBar(title: Text(AppLocalizations.of(context)?.select_language ?? Alias.errorLanguage));
    pageBody = SettingsList(
      sections: [
        SettingsSection(tiles: [
          SettingsTile(
            title: AppLocalizations.of(context)?.system_default ?? Alias.errorLanguage,
            trailing: trailingWidget(0),
            onPressed: (BuildContext context) {
              changeLanguage(index: 0, languageCode: Alias.emptyString);
            },
          ),
          SettingsTile(
            title: AppLocalizations.of(context)?.english ?? Alias.errorLanguage,
            trailing: trailingWidget(1),
            onPressed: (BuildContext context) {
              changeLanguage(index: 1, languageCode: Alias.languageCodeEnglish);
            },
          ),
          SettingsTile(
            title: AppLocalizations.of(context)?.indonesia ?? Alias.errorLanguage,
            trailing: trailingWidget(2),
            onPressed: (BuildContext context) {
              changeLanguage(index: 2, languageCode: Alias.languageCodeIndonesia);
            },
          ),
        ]),
      ],
    );

    return super.build(context);
  }

  Widget trailingWidget(int index) {
    return (_languageIndex == index) ? Icon(Icons.check, color: MainApp.getAccentColor(context)) : Icon(null);
  }

  changeLanguage({required int index, required String languageCode}) {
    setState(() {
      _presenter.setLanguage(languageCode: languageCode);
      _languageIndex = index;
    });
  }

  @override
  setSetting({required String languageCode}) {
    setState(() {
      switch (languageCode) {
        case Alias.languageCodeEnglish:
          _languageIndex = 1;
          break;
        case Alias.languageCodeIndonesia:
          _languageIndex = 2;
          break;
        default:
          _languageIndex = 0;
          break;
      }
    });
  }

  @override
  loadLanguage({required String languageCode}) {
    if (languageCode.isNotEmpty) {
      MainApp.setLocale(context, Locale(languageCode));
    } else {
      MainApp.setLocale(context, null);
    }
  }
}
