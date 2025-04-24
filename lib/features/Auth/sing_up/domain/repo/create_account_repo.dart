import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meal_planner/core/errors/failure.dart';
import '../entity/sing_up_entity.dart';

abstract class CreateAccountRepo {

  Future<Either<Failure,UserCredential>>createAccount({required SingUpEntity userEntity});
}