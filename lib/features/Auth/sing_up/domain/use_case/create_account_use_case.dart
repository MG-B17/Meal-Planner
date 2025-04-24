import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meal_planner/core/errors/failure.dart';
import 'package:meal_planner/features/Auth/sing_up/domain/repo/create_account_repo.dart';

import '../entity/sing_up_entity.dart';

class CreateAccountUseCase{
  final CreateAccountRepo createAccountRepo;

  CreateAccountUseCase({required this.createAccountRepo});

  Future<Either<Failure,UserCredential>>call({required SingUpEntity userEntity})async{
    return await createAccountRepo.createAccount(userEntity: userEntity);
  }
}