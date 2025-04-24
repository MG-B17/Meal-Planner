import 'package:dio/dio.dart';
import 'package:meal_planner/core/errors/exception.dart';
import 'package:meal_planner/core/helper/dioHelper/dio_helper.dart';
import 'package:meal_planner/features/home/data/model/recipe_model.dart';
import 'package:meal_planner/features/home/domain/entity/recipe_entity.dart';

class GetHomeRecipe {

  Future<List<RecipeEntity>> getHomeRecipe () async{
    try {
      final result =await DioHelper.getData();
      return Recipe.fromJsonList(result);
    }on DioException{
      throw ServerException();
    }
  }
}