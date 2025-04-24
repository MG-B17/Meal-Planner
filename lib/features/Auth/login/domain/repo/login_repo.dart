import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meal_planner/core/errors/failure.dart';
import '../entity/login_entity.dart';

abstract class LoginRepo {

  Future<Either<Failure,UserCredential>> login ({required LoginEntity loginEntity});
}