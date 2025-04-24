import 'package:dartz/dartz.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:meal_planner/core/errors/failure.dart';
import 'package:meal_planner/core/network/networkInfo.dart';
import 'package:meal_planner/features/profile/data/remote_data/profile_remote_data.dart';
import 'package:meal_planner/features/profile/domain/entity/user_entity.dart';
import 'package:meal_planner/features/profile/domain/repo/profile_repo.dart';

class ProfileRepoImpl extends ProfileRepo {
  final ProFileRemoteData proFileRemoteData;
  final NetworkInfo networkInfo;

  ProfileRepoImpl({required this.networkInfo,required this.proFileRemoteData});
  @override
  Future<Either<Failure, UserEntity>> getUserData()async {
    if(await networkInfo.isConnected()){
      try{
        final result = await proFileRemoteData.getUserData();
        return right(result);
      }on ServerException{
        return left(ServerFailure());
      }
    }else{
      return left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> updateUserData({required UserEntity userEntity}) async{
    if(await networkInfo.isConnected()){
      try{
        final result = await proFileRemoteData.updateProfile(
            userEntity: userEntity);
        return right(result);
      }on ServerException{
        return left(ServerFailure());
      }
    }else{
    return left(NetworkFailure());
    }
  }
}