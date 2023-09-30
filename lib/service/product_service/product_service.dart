import 'package:sqlite_example/service/database_service/database_service.dart';

class ProductService {
  static createTable() async {
    await DB.execute("""
      DROP TABLE products;
    """);

    await DB.execute(
      """
      CREATE TABLE IF NOT EXISTS products 
      (
        id INTEGER PRIMARY KEY, 
        product_name TEXT, 
        price INTEGER 
      )
      """,
    );
  }

  static Future<List> get() async {
    var items = await DB.rawQuery('SELECT * FROM products');
    return items;
  }

  static create({
    required String productName,
    required double price,
  }) async {
    // Insert some records in a transaction
    await DB.transaction((txn) async {
      await txn.rawInsert("""
        INSERT INTO products
        (product_name, price) 
        VALUES
        ("$productName", $price)
      """);
    });
  }
}
