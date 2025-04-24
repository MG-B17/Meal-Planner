import 'package:dartz/dartz.dart';
import 'package:meal_planner/core/errors/failure.dart';
import 'package:meal_planner/features/profile/domain/entity/user_entity.dart';
import 'package:meal_planner/features/profile/domain/repo/profile_repo.dart';

class GetUserDataUseCase {
  final ProfileRepo profileRepo;

  GetUserDataUseCase({required this.profileRepo});

  Future<Either<Failure,UserEntity>>call()async{
    return await profileRepo.getUserData();
  }
}