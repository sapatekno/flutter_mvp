import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_mvp/base/alias.dart';
import 'package:flutter_mvp/base/base_stateful_widget.dart';
import 'package:flutter_mvp/main.dart';
import 'package:flutter_mvp/page/setting/font/font_presenter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:settings_ui/settings_ui.dart';

class FontView extends BaseStatefulWidget {
  static const routeName = '/font';

  @override
  _FontViewState createState() => _FontViewState();
}

class _FontViewState extends BaseState<FontView, FontPresenter> implements FontContract {
  late FontPresenter _presenter;
  int _fontIndex = 0;

  @override
  void initMVP() {
    _presenter = new FontPresenter();
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
            title: AppLocalizations.of(context)?.system_default ?? Alias.errorLanguage,
            trailing: trailingWidget(0),
            onPressed: (BuildContext context) {
              changeFont(index: 0, fontName: Alias.emptyString);
            },
          ),
          SettingsTile(
            title: AppLocalizations.of(context)?.roboto ?? Alias.errorLanguage,
            titleTextStyle: GoogleFonts.roboto(),
            trailing: trailingWidget(1),
            onPressed: (BuildContext context) {
              changeFont(index: 1, fontName: Alias.roboto);
            },
          ),
          SettingsTile(
            title: AppLocalizations.of(context)?.montserrat ?? Alias.errorLanguage,
            titleTextStyle: GoogleFonts.montserrat(),
            trailing: trailingWidget(2),
            onPressed: (BuildContext context) {
              changeFont(index: 2, fontName: Alias.montserrat);
            },
          ),
          SettingsTile(
            title: AppLocalizations.of(context)?.open_sans ?? Alias.errorLanguage,
            titleTextStyle: GoogleFonts.openSans(),
            trailing: trailingWidget(3),
            onPressed: (BuildContext context) {
              changeFont(index: 3, fontName: Alias.open_sans);
            },
          ),
          SettingsTile(
            title: AppLocalizations.of(context)?.rubik ?? Alias.errorLanguage,
            titleTextStyle: GoogleFonts.rubik(),
            trailing: trailingWidget(4),
            onPressed: (BuildContext context) {
              changeFont(index: 4, fontName: Alias.rubik);
            },
          ),
        ]),
      ],
    );
    return super.build(context);
  }

  Widget trailingWidget(int index) {
    return (_fontIndex == index) ? Icon(Icons.check, color: MainApp.getAccentColor(context)) : Icon(null);
  }

  @override
  loadFont({required String fontName}) {
    MainApp.setFontName(context, fontName);
  }

  @override
  setSetting({required String fontName}) {
    setState(() {
      switch (fontName) {
        case Alias.roboto:
          _fontIndex = 1;
          break;
        case Alias.montserrat:
          _fontIndex = 2;
          break;
        case Alias.open_sans:
          _fontIndex = 3;
          break;
        case Alias.rubik:
          _fontIndex = 4;
          break;
        default:
          _fontIndex = 0;
          break;
      }
    });
  }

  changeFont({required int index, required String fontName}) {
    setState(() {
      _presenter.setFont(fontName: fontName);
      _fontIndex = index;
    });
  }
}
