import 'package:dartz/dartz.dart';
import 'package:meal_planner/core/errors/failure.dart';
import 'package:meal_planner/features/fav/data/localData/favLocalData.dart';
import 'package:meal_planner/features/fav/domain/entity/fav_meal_entity.dart';
import 'package:meal_planner/features/fav/domain/repo/fav_repo.dart';
import 'package:sqflite/sqflite.dart';

class FavRepoImpl extends FavRepo{
  final FavLocalData favLocalData;
  FavRepoImpl({required this.favLocalData});


  @override
  Future<Either<Failure, List<FavMealEntity>>> getFavMeal()async {
    try{
     final result =await favLocalData.getFavMeal();
     return right(result);
    }on DatabaseException{
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> insertFavMeal({required FavMealEntity favMeal})async {
    try{
      await favLocalData.addTOFav(meal: favMeal);
      return right(true);
    }on DatabaseException{
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> removeFavMeal({required int id}) async{
    try{
      await favLocalData.removeFormFav(id: id);
      return right(true);
    }on DatabaseException{
      return left(ServerFailure());
    }
  }

}