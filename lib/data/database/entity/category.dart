import 'package:floor/floor.dart';

@Entity(tableName: Category.tableName)
class Category {
  static const tableName = 'category';
  static const columnName = 'name';

  @PrimaryKey(autoGenerate: true)
  final int? id;

  @ColumnInfo(name: columnName)
  final String name;

  Category(this.id, this.name);
}
