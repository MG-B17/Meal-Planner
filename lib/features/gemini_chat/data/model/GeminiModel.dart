import '../../domain/entity/GeminiEntity.dart';

class Recipe extends GeminiEntity{
  final String id;
  final String recipeName;
  final String totalTime;
  final String summary;
  final String image;
  final Nutrition nutrition;
  final int numberIngredients;
  final List<String> ingredients;
  final List<String> directions;
  final String serving;
  final List mealType;

  Recipe({
    required this.id,
    required this.image,
    required this.recipeName,
    required this.totalTime,
    required this.summary,
    required this.nutrition,
    required this.numberIngredients,
    required this.ingredients,
    required this.directions,
    required this.serving,
    required this.mealType
  }):super(
      numberOfIngredients:numberIngredients.toString(),
      recipeName:recipeName,
      totalTime:totalTime,
      image: image,
    id:id ,
    serving: serving,
    summary:summary ,
    fat:nutrition.fat ,
    calories:nutrition.calories ,
    protein:nutrition.protein ,
    tittle:mealType[0] ,
    ingredients:ingredients ,
    direction: directions,
    time: totalTime
  );

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'],
      mealType: json["mealType"],
      image: json["image"],
      recipeName: json['recipeName'],
      totalTime: json['totalTime'],
      summary: json['summary'],
      nutrition: Nutrition.fromJson(json['nutrition']),
      numberIngredients: json['numberOfIngredients'],
      ingredients: List<String>.from(json['ingredients']),
      directions: List<String>.from(json['directions']),
      serving: json['serving']
    );
  }

}


class Nutrition {
  final String calories;
  final String protein;
  final String carbohydrates;
  final String fat;

  Nutrition({
    required this.calories,
    required this.protein,
    required this.carbohydrates,
    required this.fat,
  });

  factory Nutrition.fromJson(Map<String, dynamic> json) {
    return Nutrition(
      calories: json['calories']??"",
      protein: json['protein']??"",
      carbohydrates: json['carbohydrates']??"",
      fat: json['fat']??"",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'calories': calories,
      'protein': protein,
      'carbohydrates': carbohydrates,
      'fat': fat,
    };
  }
}
