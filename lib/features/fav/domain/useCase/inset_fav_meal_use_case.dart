import 'package:dartz/dartz.dart';
import 'package:meal_planner/core/errors/failure.dart';
import 'package:meal_planner/features/fav/domain/entity/fav_meal_entity.dart';
import 'package:meal_planner/features/fav/domain/repo/fav_repo.dart';

class InsertFavMealUseCase {
  final FavRepo favRepo;

  InsertFavMealUseCase({required this.favRepo});

  Future<Either<Failure, bool>>call({required FavMealEntity favMeal})async{
    return await favRepo.insertFavMeal(favMeal: favMeal);
  }
}