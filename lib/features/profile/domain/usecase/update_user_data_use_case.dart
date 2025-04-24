import 'package:dartz/dartz.dart';
import 'package:meal_planner/core/errors/failure.dart';
import 'package:meal_planner/features/profile/domain/repo/profile_repo.dart';

import '../entity/user_entity.dart';

class UpdateUserDataUseCase {
  final ProfileRepo profileRepo;

  UpdateUserDataUseCase({required this.profileRepo});

  Future<Either<Failure,bool>>call({required UserEntity userEntity})async{
    return await profileRepo.updateUserData(userEntity: userEntity);
  }
}