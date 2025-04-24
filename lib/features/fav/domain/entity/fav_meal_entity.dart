class FavMealEntity{
  final int id;
  final String name ;
  final String totalTime ;
  final double rating ;
  final String image;
  final String protein;
  final String fat;
  final String calories;
  final String summary;
  final String serving;
  final String tittle;

  FavMealEntity({
    required  this.id ,
    required this.image,
    required this.totalTime,
    required this.rating,
    required this.name,
    required this.protein,
    required this.calories,
    required this.fat,
    required this.tittle,
    required this.serving,
    required this.summary,
  });

}