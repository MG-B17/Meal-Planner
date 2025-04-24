import 'package:dartz/dartz.dart';

import '../../../../core/errors/exception.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/network/networkInfo.dart';
import '../../domain/entity/GeminiEntity.dart';
import '../../domain/repo/ChatWithGeminiRepo.dart';
import '../remoteData/geminRemoteData.dart';

class GeminiRepoImpl extends ChatWithGeminiRepo {
  final GeminiRemoteDate geminiRemoteDate ;

  final NetworkInfo networkInfo;

  GeminiRepoImpl({required this.networkInfo,required this.geminiRemoteDate});
  @override
  Future<Either<Failure, GeminiEntity>> searchRecipe({required String recipeName, required String sendTime})async {
    if(await networkInfo.isConnected()){
      try{
       final result = await geminiRemoteDate.geminiResponse(recipeName: recipeName, sendTime: sendTime);
       return right(result);
      }on ServerException{
        return left(ServerFailure());
      }
    }else{
      return left(NetworkFailure());
    }
  }
}