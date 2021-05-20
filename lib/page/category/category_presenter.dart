import 'package:flutter_mvp/base/base_presenter.dart';

abstract class CategoryContract extends BaseContract {}

class CategoryPresenter extends BasePresenter<CategoryContract> {
  getCategory() async {
    var database = await loadDatabase();
    var categoryDao = database.categoryDao;

    var result = await categoryDao.findAllCategories();
    print("hadian" + result.length.toString());
    database.close();
  }
}
