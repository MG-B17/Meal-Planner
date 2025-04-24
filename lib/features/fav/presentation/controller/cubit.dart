import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_planner/core/utilies/strings/app_strings.dart';
import 'package:meal_planner/core/utilies/widgets/snak_bar.dart';
import 'package:meal_planner/features/fav/domain/entity/fav_meal_entity.dart';
import 'package:meal_planner/features/fav/domain/useCase/get_fav_mea_use_case.dart';
import 'package:meal_planner/features/fav/domain/useCase/inset_fav_meal_use_case.dart';
import 'package:meal_planner/features/fav/domain/useCase/remove_fav_meal_use_case.dart';
import 'package:meal_planner/features/fav/presentation/controller/state.dart';

class FavCubit extends Cubit<FavStates>{
  final GetFavMealUseCase getFavMealUseCase;

  final InsertFavMealUseCase insertFavMealUseCase;

  final RemoveFavMealUseCase removeFavMealUseCase;

  FavCubit({required this.removeFavMealUseCase,required this.insertFavMealUseCase,required this.getFavMealUseCase}):super(InitialFavState());

  static FavCubit get(context)=>BlocProvider.of(context);

  bool inFav= false;

  void getFavMeals ()async{
    emit(LoadingGetFav());
    final result = await getFavMealUseCase.call();
    result.fold((failure)=>emit(GetFavFail()),(result)=>emit(GetFavSuccess(favMealEntity: result)));
  }

  void insertFavMeal ({
    required context,
    required String mealName ,
    required String totalTime,
    required double rating,
    required int id,
    required String image,
    required fat ,
    required protein,
    required tittle,
    required summary,
    required serving,
    required calories
  })async{
    emit(LoadingInsetToFav());
    final FavMealEntity fav = FavMealEntity(
        id: id,
        totalTime: totalTime,
        rating: rating,
        name: mealName,
        image: image,
        protein:protein ,
        fat: fat,
        calories:calories,
        summary:summary ,
        serving:serving,
        tittle:tittle
    );
    final result= await insertFavMealUseCase.call(favMeal: fav);

    result.fold((failure)=>emit(GetFavFail()), (result){
      ScaffoldMessenger.of(context).showMaterialBanner(mySnackBar(context: context, text: AppStrings.mealAddedToFavoriteSuccess, contentType: ContentType.success));
      Future.delayed(const Duration(seconds: 2), () {
        ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
      });
      emit(InsetToFavSuccess());
      getFavMeals();
    });
  }

  void removeFavMeal ({required int id,required context})async{
    emit(LoadingRemoveFromFav());
    final result= await removeFavMealUseCase.call(id: id);
    ScaffoldMessenger.of(context).showMaterialBanner(mySnackBar(context: context, text: AppStrings.mealRemovedFromFavoriteSuccess, contentType: ContentType.failure));
    result.fold((failure)=>emit(RemoveFromFavFail()), (result){
      emit(RemoveFromFavSuccess());
      getFavMeals();
    });
  }

  void changeFaveIcon (){
    inFav =! inFav;
    emit(ChangeFavIcon());
  }
}