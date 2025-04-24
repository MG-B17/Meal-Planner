import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meal_planner/core/errors/failure.dart';
import 'package:meal_planner/features/Auth/login/domain/repo/login_repo.dart';

import '../entity/login_entity.dart';

class LoginUseCase{
  final LoginRepo loginRepo;

  LoginUseCase({required this.loginRepo});

  Future<Either<Failure,UserCredential>>call({required LoginEntity loginEntity})async{
    return await loginRepo.login(loginEntity: loginEntity);
  }
}