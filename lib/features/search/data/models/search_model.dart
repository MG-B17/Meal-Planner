import 'package:meal_planner/features/search/domain/entity/search_entity.dart';
import '../../../../core/utilies/methods/extarct_nutrations_from_api.dart';
import '../../../../core/utilies/methods/remove_html_tag_from_api.dart';
import '../../../home/data/model/nutrations_model.dart';

class SearchModel extends SearchEntity {
  final int id;
  final String image;
  final String imageType;
  final String title;
  final int readyInMinutes;
  final int servings;
  final String? sourceUrl;
  final bool vegetarian;
  final bool vegan;
  final bool glutenFree;
  final bool dairyFree;
  final bool veryHealthy;
  final bool cheap;
  final bool veryPopular;
  final bool sustainable;
  final bool lowFodmap;
  final int weightWatcherSmartPoints;
  final String? gaps;
  final String? creditsText;
  final String? license;
  final String? sourceName;
  final double pricePerServing;
  final String summary;
  final List<String> cuisines;
  final List<String> dishTypes;
  final List<String> diets;
  final List<String> occasions;
  final double spoonacularScore;
  final String? spoonacularSourceUrl;
  final bool isFav;
  final NutrationsModel nutrationsModel;

  SearchModel({
    required this.id,
    required this.nutrationsModel,
    required this.image,
    required this.imageType,
    required this.title,
    required this.readyInMinutes,
    required this.servings,
    required this.sourceUrl,
    required this.vegetarian,
    required this.vegan,
    required this.glutenFree,
    required this.dairyFree,
    required this.veryHealthy,
    required this.cheap,
    required this.veryPopular,
    required this.sustainable,
    required this.lowFodmap,
    required this.weightWatcherSmartPoints,
    required this.gaps,
    required this.creditsText,
    required this.license,
    required this.sourceName,
    required this.pricePerServing,
    required this.summary,
    required this.cuisines,
    required this.dishTypes,
    required this.diets,
    required this.occasions,
    required this.spoonacularScore,
    required this.spoonacularSourceUrl,
    required this.isFav
  }):super(
      id: id,
      isFav:isFav,
      image:image,
      rating:spoonacularScore ,
      name:title,
      time: readyInMinutes.toString(),
      serving: servings.toString(),
      tittle: dishTypes[0],
      summary: summary,
      protein:nutrationsModel.protein ,
      fat:nutrationsModel.fat ,
      calories: nutrationsModel.calories
  );

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
      id: json['id'],
      isFav: false,
      nutrationsModel: NutrationsModel.fromjson(json: extractAllNutrition(removeHtmlTags(json['summary']))),
      image: json['image'],
      imageType: json['imageType'],
      title: json['title'],
      readyInMinutes: json['readyInMinutes'],
      servings: json['servings'],
      sourceUrl: json['sourceUrl'],
      vegetarian: json['vegetarian'],
      vegan: json['vegan'],
      glutenFree: json['glutenFree'],
      dairyFree: json['dairyFree'],
      veryHealthy: json['veryHealthy'],
      cheap: json['cheap'],
      veryPopular: json['veryPopular'],
      sustainable: json['sustainable'],
      lowFodmap: json['lowFodmap'],
      weightWatcherSmartPoints: json['weightWatcherSmartPoints'],
      gaps: json['gaps'],
      creditsText: json['creditsText'],
      license: json['license'],
      sourceName: json['sourceName'],
      pricePerServing: (json['pricePerServing'] as num).toDouble(),
      summary: removeHtmlAndNutrition(removeHtmlTags(json['summary'])),
      cuisines: List<String>.from(json['cuisines'] ?? []),
      dishTypes: List<String>.from(json['dishTypes'] ?? []),
      diets: List<String>.from(json['diets'] ?? []),
      occasions: List<String>.from(json['occasions'] ?? []),
      spoonacularScore: (json['spoonacularScore'] as num).toDouble(),
      spoonacularSourceUrl: json['spoonacularSourceUrl'],
    );
  }

  static List<SearchModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => SearchModel.fromJson(json as Map<String, dynamic>)).toList();
  }
}