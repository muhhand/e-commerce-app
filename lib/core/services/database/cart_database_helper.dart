import 'package:ecommerce_app/modal/cart_product_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../../constants.dart';
import '../../../modal/product_model.dart';

class CartDatabaseHelper{

  CartDatabaseHelper._();

  static final CartDatabaseHelper db = CartDatabaseHelper._();

  static Database _database;

  Future<Database> get database async {
    if(_database != null) return _database;


    _database = await initDb();
    return _database;

    

  }

  initDb() async {
    String path = join(await getDatabasesPath(), 'cartProducts.db');

    return await openDatabase(
        path,
        version: 1,
        onCreate: (Database db,int version) async {
          await db.execute(''' 
          CREATE TABLE $tableCartProduct (
          $columnName TEXT NOT NULL,
          $columnImage TEXT NOT NULL,
          $columnPrice TEXT NOT NULL,
          $columnQuantity INTEGER NOT NULL,
          $columnProductId TEXT NOT NULL)
           ''');
        });
  }

  Future<List<CartProductModel>> getAllProducts() async {
    var dbClient = await database;
    List<Map> maps = await dbClient.query(tableCartProduct);

    List<CartProductModel> list = maps.isNotEmpty ?
        maps.map((product) => CartProductModel.fromJson(product)).toList()
    : [];

    return list;
  }

  insert(CartProductModel model) async {
    var dbClient = await database;
    await dbClient.insert(tableCartProduct, model.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  updateProduct(CartProductModel model) async {
    var dbclient = await database;
    return await dbclient.update(tableCartProduct, model.toJson(),
      where: '${columnProductId} = ?', whereArgs: [model.productid]
    );
  }

  deleteProduct(String productId) async {
    Database _db = await database;
    await _db.delete(
      tableCartProduct,
      where: 'productId = ?',
      whereArgs: [productId],
    );
  }

  deleteAllProducts() async {
    Database _db = await database;
    await _db.delete('cartProducts');
  }

}