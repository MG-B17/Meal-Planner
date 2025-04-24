import 'package:dio/dio.dart';

class DioHelper {
 static Dio? dio;

 static void initDio() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://api.spoonacular.com/',
      receiveDataWhenStatusError: true,
    ));
  }

  static  getData() async {
   String query = "Seafood";
    final result = await dio!.get(
        "https://api.spoonacular.com/recipes/complexSearch?query=$query&addRecipeInformation=true&apiKey=46d8bbde6be8460ba9e760d9906a12a7");
  return result.data["results"];
 }

 static  getSearchData({required String mealName}) async {
   final result = await dio!.get(
       "https://api.spoonacular.com/recipes/complexSearch?query=$mealName&addRecipeInformation=true&apiKey=46d8bbde6be8460ba9e760d9906a12a7");
   return result.data["results"];
 }
}