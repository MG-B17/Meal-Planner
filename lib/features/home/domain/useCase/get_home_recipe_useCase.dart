import 'package:dartz/dartz.dart';
import 'package:meal_planner/core/errors/failure.dart';
import 'package:meal_planner/features/home/domain/entity/recipe_entity.dart';
import 'package:meal_planner/features/home/domain/repo/home_recipe_repo.dart';

class GetHomeRecipeUseCase{
  final HomeRecipeRepo homeRecipeRepo;

  GetHomeRecipeUseCase({required this.homeRecipeRepo});

  Future<Either<Failure,List<RecipeEntity>>> call ()async{
    return await homeRecipeRepo.getHomeRecipe();
  }
}