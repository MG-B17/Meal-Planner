class GeminiEntity {

  final String recipeName;
  final String totalTime ;
  final String image;
  final String numberOfIngredients;
  final String serving;
  final String tittle;
  final String summary;
  final String id;
  final String time;
  final String protein;
  final String fat;
  final String calories;
  final List ingredients;
  final List direction;


  GeminiEntity({
    required this.recipeName,
    required this.numberOfIngredients,
    required this.totalTime,
    required this.image,
    required this.tittle,
    required this.summary,
    required this.serving,
    required this.fat,
    required this.calories,
    required this.protein,
    required this.direction,
    required this.ingredients,
    required this.time,
    required this.id
  });
}