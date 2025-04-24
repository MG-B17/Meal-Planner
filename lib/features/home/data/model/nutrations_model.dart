class NutrationsModel {
final String protein;
final String fat;
final String calories;

 NutrationsModel({required this.protein ,required this.calories,required this.fat});

 factory NutrationsModel.fromjson({required Map<String,dynamic>json}){
    return NutrationsModel(
        protein: json["protein"]??"",
        calories: json["calories"]??"",
        fat: json["fat"]??""
    );
  }
}