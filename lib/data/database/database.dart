import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'entity/category.dart';
import 'dao/category_dao.dart';

part 'database.g.dart';

@Database(version: AppDatabase.version, entities: AppDatabase.entities)
abstract class AppDatabase extends FloorDatabase {
  static const entities = [
    Category,
  ];
  static const dbName = 'sapatekno.db';
  static const version = 1;

  CategoryDao get categoryDao;
}
