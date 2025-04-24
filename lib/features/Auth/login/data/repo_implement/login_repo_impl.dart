import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meal_planner/core/errors/exception.dart';
import 'package:meal_planner/core/errors/failure.dart';
import 'package:meal_planner/core/network/networkInfo.dart';
import 'package:meal_planner/features/Auth/login/data/data/remote_data.dart';
import 'package:meal_planner/features/Auth/login/domain/entity/login_entity.dart';
import 'package:meal_planner/features/Auth/login/domain/repo/login_repo.dart';

class LoginRepoImpl extends LoginRepo{
  final LoginRemoteData loginRemoteData;
  final NetworkInfo networkInfo;

  LoginRepoImpl({required this.loginRemoteData, required this.networkInfo});
  @override
  Future<Either<Failure, UserCredential>> login({required LoginEntity loginEntity})async {
    if(await networkInfo.isConnected()){
      try{
       final result = await loginRemoteData.login(loginEntity: loginEntity);
       return right(result);
      }on WrongPasswordException{
        return left(WrongPasswordFailure());
      }on ServerException{
        return left(ServerFailure());
      }
    }else{
      return left(NetworkFailure());
    }
  }
}