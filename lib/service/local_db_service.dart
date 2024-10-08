import 'package:malumotlar_ombori/data/model/mind_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class LocalDatabase{
   Database? database;
   String tableName="minds";

   LocalDatabase();

   Future<Database> getDb() async{
     if(database== null){
       database = await createDatabase();
       return database!;
     }
     return database!;
   }

   createDatabase() async{
     print("Database ochish uchun harakat boshlandi");
     String databasesPath = await getDatabasesPath();
     String dbPath = '${databasesPath}minds.db';
     print("Databasening manzili $dbPath}");

     var database = await openDatabase(dbPath, version: 1, onCreate: populateDb);
     print("Database ochildi");
     print("Database ochiqmi: ${database.isOpen}");
     return database;
   }

   void populateDb(Database database, int version) async {
     await database.execute("CREATE TABLE $tableName ("
         "mind TEXT,"
         "author TEXT"
         ")");
   }

   Future addMind(MindModel mind) async {
     Database db = await getDb();
     var id = await db.insert(tableName, mind.toJson());
     print("Mind $id bilan databsega saqlandi");
   }

   Future<List> getMinds() async {
     Database db = await getDb();

     var result = await db.query(tableName, columns: ["author", "mind"]);
     return result.toList();
   }

   Future updateMind(MindModel mindModel,String mind) async {
     Database db = await getDb();
     var id=  await db.update(tableName, mindModel.toJson(), where: "mind = ?", whereArgs: [mind]);
     print("Update bo'ldi");
   }

   Future deleteMind(String mind) async {
     Database db = await getDb();
     await db.delete(tableName, where: 'mind = ?', whereArgs: [mind]);
     print("Deteted");
   }

}