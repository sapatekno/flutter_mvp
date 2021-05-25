import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_mvp/base/alias.dart';
import 'package:flutter_mvp/base/base_stateful_widget.dart';
import 'package:flutter_mvp/main.dart';
import 'package:flutter_mvp/page/setting/font_size/font_size_presenter.dart';
import 'package:settings_ui/settings_ui.dart';

class FontSizeView extends BaseStatefulWidget {
  static const routeName = '/font_size';

  @override
  _FontSizeViewState createState() => _FontSizeViewState();
}

class _FontSizeViewState extends BaseState<FontSizeView, FontSizePresenter> implements FontSizeContract {
  late FontSizePresenter _presenter;
  int _fontSizeIndex = 0;

  @override
  void initMVP() {
    _presenter = new FontSizePresenter();
    _presenter.setView(this);

    _initView();
  }

  _initView() {
    _presenter.getSetting();
  }

  @override
  Widget build(BuildContext context) {
    pageAppBar = AppBar(title: Text(AppLocalizations.of(context)?.select_font ?? Alias.errorLanguage));
    pageBody = SettingsList(
      sections: [
        SettingsSection(tiles: [
          SettingsTile(
            title: AppLocalizations.of(context)?.small ?? Alias.errorLanguage,
            trailing: trailingWidget(0),
            onPressed: (BuildContext context) {
              changeFontSize(index: 0, fontSize: Alias.small);
            },
          ),
          SettingsTile(
            title: AppLocalizations.of(context)?.normal ?? Alias.errorLanguage,
            trailing: trailingWidget(1),
            onPressed: (BuildContext context) {
              changeFontSize(index: 1, fontSize: Alias.normal);
            },
          ),
          SettingsTile(
            title: AppLocalizations.of(context)?.large ?? Alias.errorLanguage,
            trailing: trailingWidget(2),
            onPressed: (BuildContext context) {
              changeFontSize(index: 2, fontSize: Alias.large);
            },
          ),

          /// ? Largest is to large for font?
          // SettingsTile(
          //   title: AppLocalizations.of(context)?.largest ?? Alias.errorLanguage,
          //   trailing: trailingWidget(3),
          //   onPressed: (BuildContext context) {
          //     changeFontSize(index: 3, fontSize: Alias.largest);
          //   },
          // ),
        ]),
      ],
    );
    return super.build(context);
  }

  Widget trailingWidget(int index) {
    return (_fontSizeIndex == index) ? Icon(Icons.check, color: MainApp.getAccentColor(context)) : Icon(null);
  }

  @override
  loadFontSize({required String fontSize}) {
    print("hadian $fontSize");
    MainApp.setFontSize(context, fontSize);
  }

  @override
  setSetting({required String fontSize}) {
    setState(() {
      switch (fontSize) {
        case Alias.small:
          _fontSizeIndex = 0;
          break;
        case Alias.normal:
          _fontSizeIndex = 1;
          break;
        case Alias.large:
          _fontSizeIndex = 2;
          break;
        case Alias.largest:
          _fontSizeIndex = 3;
          break;
        default:
          _fontSizeIndex = 1;
          break;
      }
    });
  }

  changeFontSize({required int index, required String fontSize}) {
    setState(() {
      _presenter.setFontSize(fontSize: fontSize);
      _fontSizeIndex = index;
    });
  }
}
