import 'package:dartz/dartz.dart';
import 'package:meal_planner/core/errors/failure.dart';
import 'package:meal_planner/features/fav/domain/entity/fav_meal_entity.dart';

abstract class FavRepo {

  Future<Either<Failure,List<FavMealEntity>>>getFavMeal();

  Future<Either<Failure,bool>> insertFavMeal ({required FavMealEntity favMeal});

  Future<Either<Failure,bool>> removeFavMeal ({required int id});
}