import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meal_planner/core/errors/exception.dart';
import 'package:meal_planner/core/errors/failure.dart';
import 'package:meal_planner/core/network/networkInfo.dart';
import 'package:meal_planner/features/Auth/sing_up/data/remote_data/create_account_remote_data.dart';
import 'package:meal_planner/features/Auth/sing_up/domain/entity/sing_up_entity.dart';
import 'package:meal_planner/features/Auth/sing_up/domain/repo/create_account_repo.dart';

class CreateAccountRepoImpl extends CreateAccountRepo{
  final CreateAccountRemoteData createAccountRemoteData;
  final NetworkInfo networkInfo;

  CreateAccountRepoImpl({required this.createAccountRemoteData,required this.networkInfo});

  @override
  Future<Either<Failure, UserCredential>> createAccount({required SingUpEntity userEntity})async {
    if(await networkInfo.isConnected()){
      try{
        final result =await createAccountRemoteData.createAccount(userEntity: userEntity);
        return right(result);
      }on WrongPasswordException{
        return left(WrongPasswordFailure());
      }on EmailUsedBeforeException{
        return left(EmailUsedBeforeFailure());
      }on ServerException{
        return left(ServerFailure());
      }
    }else{
      return left(NetworkFailure());
    }
  }

}