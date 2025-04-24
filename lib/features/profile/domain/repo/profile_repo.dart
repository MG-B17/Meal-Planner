import 'package:dartz/dartz.dart';
import 'package:meal_planner/core/errors/failure.dart';
import 'package:meal_planner/features/profile/domain/entity/user_entity.dart';

abstract class ProfileRepo {

  Future<Either<Failure,UserEntity>> getUserData();

  Future<Either<Failure,bool>>updateUserData({required UserEntity userEntity});
}