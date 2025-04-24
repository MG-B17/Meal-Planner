import 'package:dartz/dartz.dart';
import 'package:meal_planner/core/errors/exception.dart';
import 'package:meal_planner/core/errors/failure.dart';
import 'package:meal_planner/core/network/networkInfo.dart';
import 'package:meal_planner/features/home/data/home_remote_data/get_home_recipe.dart';
import 'package:meal_planner/features/home/domain/entity/recipe_entity.dart';
import 'package:meal_planner/features/home/domain/repo/home_recipe_repo.dart';

class HomeRepoImpl extends HomeRecipeRepo {

  final GetHomeRecipe getHomeRecipeO;

  final NetworkInfo networkInfo ;

  HomeRepoImpl({required this.networkInfo,required this.getHomeRecipeO});
  @override
  Future<Either<Failure, List<RecipeEntity>>> getHomeRecipe()async {
    if(await networkInfo.isConnected()){
      try {
        final result = await getHomeRecipeO.getHomeRecipe();
        return right(result);
      }on ServerException {
        return left(ServerFailure());
      }
    }
    else{
       return left(NetworkFailure());
    }
  }

}