import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDb {
  static Database? _db;
  Future<Database?> get db async {
    if (_db == null) {
      _db = await intialob();
      return _db;
    } else {
      return _db;
    }
  }

  intialob() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'mohamed112.db');
    Database mydb = await openDatabase(path,
        onCreate: _onCreate, version: 13, onUpgrade: _onUpgrade);
    return mydb;
  }

  _onUpgrade(Database db, int oldversion, int newversion) async {
    print('_onUpgrade#########################################');
    // await db.execute("ALTER TABLE notes ADD COLUMN coolor TEXT");
  }

  _onCreate(Database db, int version) async {
    Batch batch = db.batch();

    batch.execute('''
CREATE TABLE "favorite"(
  "id" INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT,
  "itemid" TEXT NOT NULL

)
''');
    print('Create#########################');
    await batch.commit();
    print('_onCreate database###########################################');
  }

  readData(String sql) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(sql);
    return response;
  }

  insertData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql);
    return response;
  }

  DeleteDate(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    return response;
  }

  UpdateDate(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }

//Deletedatabase حذف
  Deletedatabase() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'mohamed112.db');
    await deleteDatabase(path);
  }

  //////////////////////////////////////
  ///
  ///
  read(String Table) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.query(Table);
    return response;
  }

  insert(String table, Map<String, Object?> values) async {
    Database? mydb = await db;
    int response = await mydb!.insert(table, values);
    return response;
  }

  Delete(String table, String? where) async {
    Database? mydb = await db;
    int response = await mydb!.delete(table, where: where);
    return response;
  }

  Update(String taple, Map<String, Object?> values, String? where) async {
    Database? mydb = await db;
    int response = await mydb!.update(taple, values, where: where);
    return response;
  }
}
