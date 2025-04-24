import 'package:meal_planner/features/fav/domain/entity/fav_meal_entity.dart';

abstract class FavStates {}

class InitialFavState extends FavStates{}

class LoadingGetFav extends FavStates{}

class GetFavSuccess extends FavStates{
  final List<FavMealEntity> favMealEntity;

  GetFavSuccess({required this.favMealEntity});
}

class GetFavFail extends FavStates{}

class LoadingInsetToFav extends FavStates{}

class InsetToFavSuccess extends FavStates{}

class InsetToFavFail extends FavStates{}

class LoadingRemoveFromFav extends FavStates{}

class RemoveFromFavSuccess extends FavStates{}

class RemoveFromFavFail extends FavStates{}

class ChangeFavIcon extends FavStates {}