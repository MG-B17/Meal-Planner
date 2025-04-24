import 'dart:convert';
import 'package:dio/dio.dart';
import 'api_strings.dart';

class RecipeApi{

  static Dio? dio;



  static initDio(){
    dio =Dio(
        BaseOptions(
            receiveDataWhenStatusError: true,
            baseUrl: ApiStrings.baseUrl,
            headers: {
              "Content-Type": "application/json",
            }
        )
    );
  }


  static Future<String> getRecipePhoto({required String recipeName})async{
    final result =await dio!.get(ApiStrings.searchEndpoint,queryParameters: {
      'query': recipeName,
      'apiKey':ApiStrings.apiKey
    });
    Map<String,dynamic> image = jsonDecode(result.toString());
    return image["results"][1]["image"];
  }

}