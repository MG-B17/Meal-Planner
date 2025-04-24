import 'package:dartz/dartz.dart';
import 'package:meal_planner/core/errors/failure.dart';
import 'package:meal_planner/features/fav/domain/entity/fav_meal_entity.dart';
import 'package:meal_planner/features/fav/domain/repo/fav_repo.dart';

class GetFavMealUseCase {
  final FavRepo favRepo;

  GetFavMealUseCase({required this.favRepo});

  Future<Either<Failure,List<FavMealEntity>>>call()async{
    return await favRepo.getFavMeal();
  }
}