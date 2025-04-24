import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../../../features/fav/domain/entity/fav_meal_entity.dart';

class SqfliteHelper {
 static Database? dataBase;

 static Future<String> getDatabasePath() async {
    final directory = await getApplicationDocumentsDirectory();
    return join(directory.path, 'mealPlanner.db');
  }

 static Future<Database> initializeDatabase() async {
    final dbPath = await getDatabasePath();
    return await openDatabase(
        dbPath,
        version: 1,
        onCreate: (db, version) async {
          await db.execute(
              "CREATE TABLE MealInfo ("
                  "id INTEGER , "
                  "mealName TEXT, "
                  "rating Double, "
                  "totalTime TEXT, "
                  "summary TEXT ,"
                  "fat TEXT ,"
                  "protein TEXT ,"
                  "calories TEXT ,"
                  "serving TEXT ,"
                  "tittle TEXT ,"
                  "mealImage TEXT "
                  ")",
          );
          print('Table created');
        },
        onOpen: (db) {
          print('Database opened');
          // Call your function to fetch tasks here if needed
          // getTasksFromDataBase(db: db);
        });
  }


static  void createDatabase() async {
    try {
      dataBase = await initializeDatabase();
    } catch (e) {
      print('Error creating database: $e');
    }
  }


 static void insertIntoDB({required FavMealEntity favMeal}) async {
    try {
      if (dataBase == null) {
        print('Database is not initialized');
        return;
      }
       await dataBase?.transaction((txn) async {
        await txn.rawInsert(
          "INSERT INTO MealInfo ("
              "id , "
              "mealName , "
              "rating , "
              "totalTime , "
              "summary,"
              "fat  ,"
              "protein ,"
              "calories ,"
              "serving ,"
              "tittle ,"
              "mealImage"
              ")"
              "VALUES (?,?, ?, ?, ?,?,?,?,?,?,?)",
          [favMeal.id,favMeal.name,favMeal.rating,favMeal.totalTime,favMeal.summary,favMeal.fat,favMeal.protein,favMeal.calories,favMeal.serving,favMeal.tittle,favMeal.image],
        ).then((value){
          print("added successfully");
        }).catchError((error){
          print(error);
        });
      });
      print('Data inserted successfully: done');
    } catch (e) {
      print('Error inserting data: $e');
    }
  }


 static Future<List<Map<String, dynamic>>> getDataFromDB() async {
    try {
      if (dataBase == null) {
        print('Database is not initialized');
        return [];
      }

      final List<Map<String, dynamic>> data = await dataBase!.query('MealInfo');
      print('Data retrieved successfully: $data');
      return data;
    } catch (e) {
      print('Error retrieving data: $e');
      return [];
    }
  }

 static Future<void> deleteFromDB({required int id}) async {
    try {
      if (dataBase == null) {
        print('Database is not initialized');
        return;
      }

      int result = await dataBase!.delete(
        'MealInfo', // Table name
        where: 'id = ?', // Condition
        whereArgs: [id], // Arguments for the condition
      );

      if (result > 0) {
        print('Record with id $id deleted successfully');
      } else {
        print('No record found with id $id');
      }
    } catch (e) {
      print('Error deleting data: $e');
    }
  }


 static Future<void> deleteDatabaseFile() async {
    try {
      final dbPath = await getDatabasePath();
      await deleteDatabase(dbPath);
      print('Database successfully deleted');
    } catch (e) {
      print('Error deleting database: $e');
    }
  }

  static void deleteDB() async {
    try {
      await deleteDatabaseFile();
    } catch (e) {
      print('Error deleting database: $e');
    }
  }

}