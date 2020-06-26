import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class IDatabase {
  dynamic getDatabase() {
  }
}

class SQLiteDatabase extends IDatabase {
  final databaseName = "meu_cupon";
  static const String CREATE_COUPON_TABLE_SCRIPT = "CREATE TABLE coupon(id INTEGER PRIMARY KEY, buyed_at DATETIME, city TEXT, state TEXT, neighborhood TEXT, address TEXT, stablishmentName Text)";
  static const String CREATE_ITEM_TABLE_SCRIPT = "CREATE TABLE item(id INTEGER PRIMARY KEY, coupon_id INTEGER, description TEXT, price INTEGER, quantity DOUBLE)";

  @override
  Future<Database> getDatabase () async {
    String databasePath = join(await getDatabasesPath(), "meu_cupon");
    return openDatabase(
      databasePath,
      onCreate: (database, version) {
        this._createTables(database);
      },
      version: 1
    );
  }

  void _createTables (Database database) {
    database.execute(CREATE_COUPON_TABLE_SCRIPT);
    database.execute(CREATE_ITEM_TABLE_SCRIPT);
  }
}

