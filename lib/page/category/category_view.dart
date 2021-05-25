import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_mvp/base/base_stateful_widget.dart';
import 'package:flutter_mvp/page/category/category_presenter.dart';
import 'package:flutter_mvp/page/setting/setting_view.dart';

class CategoryView extends BaseStatefulWidget {
  static const routeName = '/category';

  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends BaseState<CategoryView, CategoryPresenter> with SingleTickerProviderStateMixin implements CategoryContract {
  late CategoryPresenter _presenter;
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void initMVP() {
    _presenter = new CategoryPresenter();
    _tabController = new TabController(length: 2, vsync: this);
    _presenter.setView(this);
  }

  @override
  Widget build(BuildContext context) {
    pageBody = DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Category'),
          actions: [
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.pushNamed(context, SettingView.routeName);
              },
            )
          ],
          bottom: TabBar(
            controller: _tabController,
            tabs: [
              Tab(text: AppLocalizations.of(context)!.income),
              Tab(text: AppLocalizations.of(context)!.expense),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              child: Text("Hello Dunia"),
            ),
            Icon(Icons.directions_transit),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _presenter.getCategory();
            showSnackBar(message: "Hello position ${_tabController.index}");
          },
          child: Icon(Icons.add),
        ),
      ),
    );

    return super.build(context);
  }
}
