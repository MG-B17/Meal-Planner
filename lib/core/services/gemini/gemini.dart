import 'dart:convert';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:meal_planner/core/services/recipe_api_image/recipe_image_api.dart';


class GeminiApi{

  static Future<Map<String,dynamic>> geminiResponse({required String recipeName,required String sendTime})async{
    final model = GenerativeModel(
      model: 'gemini-1.5-flash',
      apiKey: "AIzaSyBom3Hd-Ssxs6KMbxa-I6TE8H--eUQNR2g",
    );
    final image = await RecipeApi.getRecipePhoto(recipeName: recipeName);
    String prompt = '''
  Provide a response for the input $recipeName. If $recipeName 
  does not correspond to a valid recipe, return: 'No information available'. 
  Otherwise, generate a detailed JSON output structured as follows and add $image that i will give it to you in your json response : 
  {
    const "sendTime":"$sendTime"
    const "id":"gemini"
    "image":"$image"
    "recipeName":"..."
    "totalTime ":"..."
    "summary": "...", 
    "serving": "...", 
    "mealType": "...",
    "nutrition": "...", 
    "numberOfIngredients": ...,
    "ingredients": [...], 
    "directions": "...",
  }. 
  Ensure the information is accurate, concise, and comprehensive.
  ''';

    final response = await model.generateContent([Content.text(prompt)]);

    final cleanedResponse = response.text?.replaceAll(RegExp(r'```json|```'), '') // Removes code markers
        .trim();

    final Map<String, dynamic> jsonResponse = jsonDecode(cleanedResponse!);

    // print(jsonResponse);
    return jsonResponse;
  }
}