import 'package:dartz/dartz.dart';
import 'package:meal_planner/core/errors/failure.dart';
import 'package:meal_planner/features/search/domain/entity/search_entity.dart';

abstract class SearchRepo {
  Future<Either<Failure,List<SearchEntity>>>search({required String mealName});
}