import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_planner/core/errors/mapFailureToMessage.dart';
import 'package:meal_planner/features/search/domain/usecase/search_usecase.dart';
import 'package:meal_planner/features/search/presentation/controller/state.dart';

class SearchCubit extends Cubit<SearchState>{
  final SearchUseCase searchUseCase;

  SearchCubit({required this.searchUseCase}):super(InitialSearchState());

  static SearchCubit get(context)=>BlocProvider.of(context);


  void search({required String mealName})async{
    emit(LoadingSearch());
    final result = await searchUseCase.call(mealName: mealName);
    result.fold((failure)=>emit(SearchFail(errorMessage: mapFailureToMessage(failure: failure))),(result)=>emit(SearchSuccess(search: result)));
  }
}