import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_planner/config/navigaation/navigation.dart';
import 'package:meal_planner/core/utilies/colors/color_manager.dart';
import 'package:meal_planner/core/utilies/methods/add_random_num.dart';
import 'package:meal_planner/features/details_screen/presentation/screen/meal_details.dart';
import 'package:meal_planner/features/fav/presentation/controller/cubit.dart';
import 'package:meal_planner/features/fav/presentation/controller/state.dart';

class GeminiResponse extends StatelessWidget {

  String image;
  String recipeName;
  String numOfIngredients;
  String time;
  String protein;
  String fat;
  String calories;
  String serving;
  String tittle;
  String summary;
  final List ingredients;
  final List direction;

  GeminiResponse({
    required this.image,
    required this.recipeName,
    required this.numOfIngredients,
    required this.time,
    required this.tittle,
    required this.summary,
    required this.serving,
    required this.fat,
    required this.calories,
    required this.protein,
    required this.direction,
    required this.ingredients,
  });


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavCubit,FavStates>(
      listener: (context,state){},
      builder:(context,state){
        return FadeInUp(
          duration: Duration(seconds: 1),
          child: InkWell(
            onTap: (){
              PushNavigation().navigation(
                  context: context,
                  screen: MealDetails(
                      direction: direction,
                      protein: protein,
                      time: time,
                      serving: serving,
                      ingredients: ingredients,
                      name: recipeName,
                      image: image,
                      tittle: tittle,
                      summary: summary,
                      fat: fat,
                      calories: calories
                  )
              );
            },
            onLongPress: (){
              FavCubit.get(context).insertFavMeal(
                  context: context,
                  mealName: recipeName,
                  totalTime: time,
                  rating: 4.4,
                  id: generateRandomInt(),
                  image: image,
                  fat: fat,
                  protein: protein,
                  tittle: tittle,
                  summary: summary,
                  serving: serving,
                  calories: calories
              );
            },
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: 300.w,
                    decoration:BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration:BoxDecoration(
                                borderRadius: BorderRadius.circular(20)
                            ),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Image(
                              image: NetworkImage(image),
                              width: 300.w,
                              height: 200.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            recipeName,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "$numOfIngredients ingredients",
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "$time",
                            style: TextStyle(
                              color: ColorManager.secondaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      } ,
    );
  }
}
