import 'package:meal_planner/features/home/domain/entity/recipe_entity.dart';

abstract class HomePageState {}

class HomePageInitialState extends HomePageState{}

class LoadingHomeData extends HomePageState{}

class GetHomeDataSuccess extends HomePageState{
  final List<RecipeEntity> result ;

  GetHomeDataSuccess({required this.result});
}

class GetHomeDataFail extends HomePageState{
  final String message;

  GetHomeDataFail({required this.message}){
    print(message);
  }
}