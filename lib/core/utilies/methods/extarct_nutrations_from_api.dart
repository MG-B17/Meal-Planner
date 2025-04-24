Map<String, String> extractAllNutrition(String recipeText) {
  final nutritionMap = <String, String>{};

  // Regular expressions to find the nutrition information
  final proteinRegex = RegExp(r'\s+(\d+g)\s+of\s+protein');
  final fatRegex = RegExp(r'(\d+g)\s+of\s+fat');
  final caloriesRegex = RegExp(r'a\s+total\s+of\s+(\d+\s+calories)');

  // Extract protein
  final proteinMatch = proteinRegex.firstMatch(recipeText);
  if (proteinMatch != null && proteinMatch.groupCount >= 1) {
    nutritionMap['protein'] = proteinMatch.group(1)!;
  }

  // Extract fat
  final fatMatch = fatRegex.firstMatch(recipeText);
  if (fatMatch != null && fatMatch.groupCount >= 1) {
    nutritionMap['fat'] = fatMatch.group(1)!;
  }

  // Extract calories
  final caloriesMatch = caloriesRegex.firstMatch(recipeText);
  if (caloriesMatch != null && caloriesMatch.groupCount >= 1) {
    nutritionMap['calories'] = caloriesMatch.group(1)!.replaceAll(' calories', '');
  }

  return nutritionMap;
}