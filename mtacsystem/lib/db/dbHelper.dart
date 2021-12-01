import 'package:mtacsystem/models/schedule.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper{
  static Database? _db;
  static final int _version = 1;
  static final String _tableName = "schedule";

  static Future<void> initDb()async{
    if(_db != null){
      return;
    }
    try{
      String _path = await getDatabasesPath() + 'schedules.db';
      _db = await openDatabase(
        _path,
        version: _version,
        onCreate: (db, version){
          print("Create a new db");
          return db.execute(
            "CREATE TABLE $_tableName("
                "id INTEGER PRIMARY KEY,"
                "id_card STRING, id_vac INTEGER, id_hos INTEGER,"
                "title STRING, note TEXT, registerDate STRING, "
                "registerTime STRING)",                
          );
        }
      );
    }
    catch(e){
      print(e);
    }
  }

  static Future<int> insert(Schedule? schedule) async{
    print('Start insert');
    return await _db?.insert(_tableName, schedule!.toJson())??1;
  }

  static Future<List<Map<String, dynamic>>> query() async{
    print('Query');
    return await _db!.query(_tableName);
  }

  static delete(Schedule schedule)async{
    return await _db!.delete(_tableName, where: 'id=?', whereArgs: [schedule.id]);
  }

}