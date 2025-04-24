import 'package:dio/dio.dart';
import 'package:meal_planner/features/search/data/models/search_model.dart';
import 'package:meal_planner/features/search/domain/entity/search_entity.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/helper/dioHelper/dio_helper.dart';

class SearchRemoteData {
  Future<List<SearchEntity>> getHomeRecipe ({required String mealName}) async{
    try {
      final result =await DioHelper.getSearchData(mealName: mealName);
      return SearchModel.fromJsonList(result);
    }on DioException{
      throw ServerException();
    }
  }
}