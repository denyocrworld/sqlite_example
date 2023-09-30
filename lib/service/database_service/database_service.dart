import 'package:sqflite/sqflite.dart';
import 'package:sqlite_example/service/product_service/product_service.dart';

late Database DB;

class DatabaseService {
  static connect() async {
    DB = await openDatabase('database.db');
    await ProductService.createTable();
  }
}
