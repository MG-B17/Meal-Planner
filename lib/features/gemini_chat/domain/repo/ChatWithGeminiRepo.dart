import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entity/GeminiEntity.dart';

abstract class ChatWithGeminiRepo{
  Future<Either<Failure,GeminiEntity>>searchRecipe({required String recipeName,required String sendTime});
}