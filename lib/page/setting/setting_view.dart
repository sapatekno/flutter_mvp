import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_mvp/base/alias.dart';
import 'package:flutter_mvp/base/base_stateful_widget.dart';
import 'package:flutter_mvp/base/fun.dart';
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
  String _languageName = "";

  @override
  void initMVP() {
    _presenter = new SettingPresenter();
    _presenter.setView(this);

    initView();
  }

  @override
  Widget build(BuildContext context) {
    pageAppBar = AppBar(title: Text(AppLocalizations
        .of(context)
        ?.settings ?? Alias.errorLanguage));

    pageBody = SettingsList(
      sections: [
        SettingsSection(
          tiles: [
            SettingsTile(
              title: AppLocalizations
                  .of(context)
                  ?.language ?? Alias.errorLanguage,
              subtitle: _languageName,
              leading: Icon(Icons.language),
              onPressed: (BuildContext context) {
                Navigator.pushNamed(context, LanguageView.routeName).then((value) => initView());
              },
            ),
            SettingsTile(
              title: AppLocalizations
                  .of(context)
                  ?.theme ?? Alias.errorLanguage,
              subtitle: AppLocalizations
                  .of(context)
                  ?.light ?? Alias.errorLanguage,
              leading: Icon(Icons.brightness_4),
              onPressed: (BuildContext context) {
                Navigator.pushNamed(context, ThemeView.routeName).then((value) => initView());
              },
            ),
            SettingsTile(
              title: AppLocalizations
                  .of(context)
                  ?.accent_color ?? Alias.errorLanguage,
              subtitle: AppLocalizations
                  .of(context)
                  ?.blue ?? Alias.errorLanguage,
              leading: Icon(Icons.circle, color: Colors.blue),
              onPressed: (BuildContext context) {
                Navigator.pushNamed(context, LanguageView.routeName);
              },
            ),
            SettingsTile(
              title: AppLocalizations
                  .of(context)
                  ?.font ?? Alias.errorLanguage,
              subtitle: 'Roboto',
              leading: Icon(Icons.font_download),
              onPressed: (BuildContext context) {
                Navigator.pushNamed(context, LanguageView.routeName);
              },
            ),
            SettingsTile(
              title: AppLocalizations
                  .of(context)
                  ?.font_size ?? Alias.errorLanguage,
              subtitle: 'Normal',
              leading: Icon(Icons.text_fields),
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
  setLanguageCode({String? languageCode}) {
    setState(() {
      _languageName = Fun.languageCodeToLanguageName(context: context, languageCode: languageCode);
    });
  }

  initView() {
    _presenter.getConfig();
  }
}
