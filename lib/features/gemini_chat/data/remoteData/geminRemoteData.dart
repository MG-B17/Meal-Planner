import '../../../../core/services/gemini/gemini.dart';
import '../../domain/entity/GeminiEntity.dart';
import '../model/GeminiModel.dart';


class GeminiRemoteDate {

  Future<GeminiEntity> geminiResponse({required String recipeName, required String sendTime})async{
    final result = await  GeminiApi.geminiResponse(recipeName: recipeName, sendTime: sendTime);
    return Recipe.fromJson(result);
  }

}