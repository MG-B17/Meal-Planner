import 'package:meal_planner/features/fav/domain/entity/fav_meal_entity.dart';

class FavMealModel extends FavMealEntity {

  final String mealName ;
  final String mealTotalTime;
  final double mealRating;
  final int mealId ;
  final String mealImage;
  final String protein;
  final String fat;
  final String calories;
  final String summary;
  final String serving;
  final String tittle;

  FavMealModel({
    required this.mealId,
    required this.mealTotalTime,
    required this.mealName,
    required this.mealRating,
    required this.mealImage,
    required this.protein,
    required this.calories,
    required this.fat,
    required this.tittle,
    required this.serving,
    required this.summary,
  }):super(
    image: mealImage,
    id: mealId,
    name: mealName,
    totalTime: mealTotalTime,
    rating: mealRating,
    fat: fat ,
    calories:calories,
    protein: protein,
    serving:serving ,
    summary: summary,
    tittle: tittle
  );

  factory FavMealModel.fromJson(Map<String,dynamic> json){
    return FavMealModel(
        mealId: json["id"],
        mealImage:json["mealImage"] ,
        mealTotalTime: json["totalTime"],
        mealName: json["mealName"],
        mealRating: json["rating"],
        fat: json["fat"],
        protein:json["protein"] ,
        calories:json["calories"] ,
        summary:json["summary"] ,
        tittle: json["tittle"],
       serving: json["serving"],
    );
  }

  static List<FavMealModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => FavMealModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}