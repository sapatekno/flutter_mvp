import 'package:floor/floor.dart';
import 'package:flutter_mvp/data/database/entity/category.dart';

@dao
abstract class CategoryDao {
  @Query("SELECT * FROM ${Category.tableName}")
  Future<List<Category>> findAllCategories();

  @Query("SELECT * FROM ${Category.tableName} WHERE id = :id")
  Stream<Category?> findCategoryById(int id);

  @insert
  Future<void> insertCategory(Category category);
}
