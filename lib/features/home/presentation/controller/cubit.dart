import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_planner/core/errors/mapFailureToMessage.dart';
import 'package:meal_planner/features/home/domain/useCase/get_home_recipe_useCase.dart';
import 'package:meal_planner/features/home/presentation/controller/state.dart';

class HomePageCubit extends Cubit<HomePageState>{

  final GetHomeRecipeUseCase getHomeRecipeUseCase;

  HomePageCubit({required this.getHomeRecipeUseCase}):super(HomePageInitialState());

  static HomePageCubit get(context)=>BlocProvider.of(context);

  void getHomeRecipe ()async{
    emit(LoadingHomeData());
    final result = await getHomeRecipeUseCase.call();

    result.fold((failure)=>emit(GetHomeDataFail(message: mapFailureToMessage(failure: failure))), (result)=>emit(GetHomeDataSuccess(result: result)));
  }
}