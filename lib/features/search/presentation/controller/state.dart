import 'package:meal_planner/features/search/domain/entity/search_entity.dart';

abstract class SearchState {}

class InitialSearchState extends SearchState{}

class LoadingSearch extends SearchState{}

class SearchSuccess extends SearchState{
  final List<SearchEntity> search ;

  SearchSuccess({required this.search});
}

class SearchFail extends SearchState{

  final String errorMessage;

  SearchFail({required this.errorMessage});
}