import '../../domain/entity/GeminiEntity.dart';

abstract class GeminiChatStates {}

class InitialGeminiSearchState extends GeminiChatStates{}

class LoadingSearch extends GeminiChatStates{}

class GeminiSearchSuccess extends GeminiChatStates{
  final GeminiEntity geminiResponse;

  GeminiSearchSuccess({required this.geminiResponse});
}

class GeminiSearchFail extends GeminiChatStates{

  final String errorMessage;

  GeminiSearchFail({required this.errorMessage});
}