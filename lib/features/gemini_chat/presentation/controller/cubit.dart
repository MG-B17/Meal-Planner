import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_planner/features/gemini_chat/presentation/controller/states.dart';
import '../../../../core/errors/mapFailureToMessage.dart';
import '../../domain/useCase/searchUseCase.dart';

class GeminiChatCubit extends Cubit<GeminiChatStates> {

  final ChatWithGeminiUseCase chatWithGeminiUseCase;

  GeminiChatCubit({required this.chatWithGeminiUseCase}):super(InitialGeminiSearchState());

  static GeminiChatCubit get(context)=> BlocProvider.of(context);

  List<String> userMessage =[];

  void geminiChat({required String recipeName, required String sendTime})async{
    emit(LoadingSearch());
    userMessage.clear();
    userMessage.add(recipeName);
    final result = await chatWithGeminiUseCase.call(recipeName: recipeName, sendTime: sendTime);
    result.fold((failure)=>emit(GeminiSearchFail(errorMessage: mapFailureToMessage(failure: failure))),(r)=>emit(GeminiSearchSuccess(geminiResponse: r)));
  }
}