import 'package:meal_planner/core/services/save_fav/fav_sqflite.dart';
import 'package:meal_planner/features/fav/data/model/fav_meal_model.dart';
import 'package:meal_planner/features/fav/domain/entity/fav_meal_entity.dart';

class FavLocalData {

   addTOFav({required FavMealEntity meal})async{
   SqfliteHelper.insertIntoDB(favMeal: meal);
  }

  Future<List<FavMealEntity>> getFavMeal()async{
   final dbResult= await SqfliteHelper.getDataFromDB();
   return  FavMealModel.fromJsonList(dbResult);
  }

   removeFormFav({required int id})async{
     SqfliteHelper.deleteFromDB(id: id);
   }
}