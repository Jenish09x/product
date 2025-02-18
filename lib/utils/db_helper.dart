import 'package:flutter/services.dart';
import 'package:project/utils/db_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DbHelper {
  static DbHelper helper = DbHelper._();

  DbHelper._();

  Database? DB;
  String DB_NAME = "product";

  Future<Database?> checkDb() async {
    if (DB != null) {
      return DB;
    } else {
      return await initDb();
    }
  }

  Future<Database> initDb() async {
    final dir = await getApplicationDocumentsDirectory();
    String path = join(dir.path, DB_NAME);
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
            "CREATE TABLE product(id INTEGER PRIMARY KEY AUTOINCREMENT,title TEXT,image TEXT,price TEXT,detail TEXT)");
      },
    );
  }

  Future<void> addData(DbModel model) async {
    DB = await checkDb();
    DB!.insert('product', {
      'title': model.title,
      'image': model.image,
      'price': model.price,
      'detail': model.detail,
    });
  }

  Future<List<DbModel>> readData() async {
    DB = await checkDb();
    String query = 'SELECT * FROM product';
    List<Map> l1 = await DB!.rawQuery(query);
    List<DbModel> modelList = l1.map((e) => DbModel.mapToModel(e)).toList();
    return modelList;
  }

  Future<void> deleteData(int? id) async {
    DB = await checkDb();
    await DB!.delete('product', where: "id=?", whereArgs: [id]);
  }

}
