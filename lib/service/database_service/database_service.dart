import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static late Database db;
  static connect() async {
    db = await openDatabase('database.db');
  }

  static createTable() async {
    await db.execute(
      """
      CREATE TABLE products 
      (
        id INTEGER PRIMARY KEY, 
        product_name TEXT, 
        price REAL
      )
      """,
    );
  }

  static createProduct({
    required String productName,
    required double price,
  }) async {
    // Insert some records in a transaction
    await db.transaction((txn) async {
      await txn.rawInsert("""
        INSERT INTO products
        (product_name, price) 
        VALUES
        ("$productName", $price)'
      """);
    });
  }
}
