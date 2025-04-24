import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entity/GeminiEntity.dart';
import '../repo/ChatWithGeminiRepo.dart';

class ChatWithGeminiUseCase {
  final ChatWithGeminiRepo chatWithGeminiRepo;

  ChatWithGeminiUseCase({required this.chatWithGeminiRepo});

  Future<Either<Failure,GeminiEntity>> call({required String recipeName, required String sendTime})async{
    return await chatWithGeminiRepo.searchRecipe(recipeName: recipeName, sendTime: sendTime);
  }
}