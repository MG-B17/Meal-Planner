import 'package:dartz/dartz.dart';
import 'package:meal_planner/core/errors/failure.dart';
import 'package:meal_planner/features/fav/domain/repo/fav_repo.dart';

class RemoveFavMealUseCase {
  final FavRepo favRepo;

  RemoveFavMealUseCase({required this.favRepo});

  Future<Either<Failure, bool>>call({required int id})async{
    return await favRepo.removeFavMeal(id: id);
  }
}