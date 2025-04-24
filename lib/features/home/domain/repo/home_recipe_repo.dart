import 'package:dartz/dartz.dart';
import 'package:meal_planner/core/errors/failure.dart';
import 'package:meal_planner/features/home/domain/entity/recipe_entity.dart';

abstract class HomeRecipeRepo {

  Future<Either<Failure,List<RecipeEntity>>> getHomeRecipe();
}