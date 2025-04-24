class SearchEntity{
  String image ;
  String name ;
  String serving;
  double rating ;
  String tittle;
  String summary;
  int id;
  String time;
  bool isFav;
  String protein;
  String fat;
  String calories;


  SearchEntity({
    required this.id,
    required this.isFav,
    required this.name,
    required this.image,
    required this.rating,
    required this.time,
    required this.tittle,
    required this.summary,
    required this.serving,
    required this.fat,
    required this.calories,
    required this.protein
  });
}