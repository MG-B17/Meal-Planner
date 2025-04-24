import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_planner/core/utilies/colors/color_manager.dart';
import 'package:meal_planner/core/utilies/strings/app_strings.dart';
import 'package:meal_planner/core/utilies/widgets/loading.dart';
import 'package:meal_planner/core/utilies/widgets/unexpected_error.dart';
import 'package:meal_planner/features/fav/presentation/controller/cubit.dart';
import 'package:meal_planner/features/home/presentation/controller/cubit.dart';
import 'package:meal_planner/features/home/presentation/controller/state.dart';
import 'package:meal_planner/features/home/presentation/widgets/meal_icon.dart';
import 'package:meal_planner/features/home/presentation/widgets/search_bar.dart';
class HomeScreen extends StatefulWidget {
 HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String message ="";

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageCubit,HomePageState>(
      listener:(context,state){
        if (state is GetHomeDataFail){
          message=state.message;
        }
      },
      builder:(context,state){
        if(state is LoadingHomeData){
          return Center(child: spinKit,);
        }else if(state is GetHomeDataSuccess) {
          return CustomScrollView(
            slivers: <Widget>[
              searchBar(context),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                sliver: SliverToBoxAdapter(
                  child: Text(
                    AppStrings.recommendedForYou,
                    style: TextStyle(
                      color: ColorManager.myBlack,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (context,index)=>MealIcon(
                        onTap:  (){
                          FavCubit.get(context).insertFavMeal(
                            context: context,
                              id: state.result[index].id,
                              image:state.result[index].image,
                              totalTime:state.result[index].time,
                              rating:state.result[index].rating,
                              mealName: state.result[index].name,
                              summary:state.result[index].summary ,
                              serving: state.result[index].serving,
                              fat: state.result[index].fat,
                              protein:state.result[index].protein ,
                              calories:state.result[index].calories ,
                              tittle: state.result[index].tittle
                          );
                        },
                        isFav: state.result[index].isFav,
                        tittle: state.result[index].tittle,
                        protein: state.result[index].protein,
                        calories:state.result[index].calories ,
                        fat: state.result[index].fat,
                        summary: state.result[index].summary,
                        imageUrl: state.result[index].image,
                        mealTittle: state.result[index].name,
                        time: state.result[index].time,
                        serving: state.result[index].serving,
                        rating: state.result[index].rating,
                      ),
                    childCount: state.result.length
                  )
              )
            ],
          );
        }else if (state is GetHomeDataFail){
         return  UnexpectedErrorWidget();
        }else{
          return UnexpectedErrorWidget();
        }
      },
    );
  }
}
