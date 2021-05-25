import 'package:flutter_mvp/base/base_stateful_widget.dart';
import 'package:flutter_mvp/page/home/home_presenter.dart';

class HomeView extends BaseStatefulWidget {
  static const routeName = '/home';

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends BaseState<HomeView, HomePresenter> implements HomeContract {
  late HomePresenter _presenter;

  @override
  void initState() {
    super.initState();
    _presenter = new HomePresenter();
    _presenter.setView(this);
    print("ini dari home");
  }
}
