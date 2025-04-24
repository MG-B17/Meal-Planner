import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_planner/features/fav/presentation/controller/cubit.dart';
import 'package:meal_planner/features/home/presentation/widgets/meal_icon.dart';
import 'package:meal_planner/features/search/domain/entity/search_entity.dart';
import 'package:meal_planner/features/search/presentation/controller/cubit.dart';
import 'package:meal_planner/features/search/presentation/controller/state.dart';
import 'package:meal_planner/features/search/presentation/widgets/empty_search.dart';
import 'package:meal_planner/features/search/presentation/widgets/search_app_bar.dart';
import 'package:meal_planner/features/search/presentation/widgets/search_form_filed.dart';

import '../../../../core/utilies/widgets/loading.dart';

class SearchScreen extends StatelessWidget {
 SearchScreen({super.key});

  TextEditingController search=TextEditingController();

  List<SearchEntity> searchResult =[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: searchAppBar(context),
      body: Padding(
        padding:EdgeInsets.symmetric(vertical: 10.h,),
        child: Column(
          children: [
            SearchFormFiled(search: search),
            BlocConsumer<SearchCubit,SearchState>(
              listener: (context,state){
                if (state is SearchSuccess){
                  searchResult=state.search;
                }
              },
              builder:(context,state){
                if(state is LoadingSearch){
                  return Padding(
                    padding:EdgeInsets.symmetric(vertical: 50.h),
                    child: Center(child: spinKit,),
                  );
                }else{
                  return searchResult.isNotEmpty?Expanded(
                    child: ListView.builder(
                        itemBuilder: (context,index)=>MealIcon(
                          onTap:  (){
                            FavCubit.get(context).insertFavMeal(
                                context: context,
                                id: searchResult[index].id,
                                image:searchResult[index].image,
                                totalTime:searchResult[index].time,
                                rating:searchResult[index].rating,
                                mealName: searchResult[index].name,
                                summary:searchResult[index].summary ,
                                serving: searchResult[index].serving,
                                fat: searchResult[index].fat,
                                protein:searchResult[index].protein ,
                                calories:searchResult[index].calories ,
                                tittle:searchResult[index].tittle
                            );
                          },
                          isFav: searchResult[index].isFav,
                          tittle: searchResult[index].tittle,
                          protein: searchResult[index].protein,
                          calories:searchResult[index].calories ,
                          fat: searchResult[index].fat,
                          summary: searchResult[index].summary,
                          imageUrl: searchResult[index].image,
                          mealTittle:searchResult[index].name,
                          time: searchResult[index].time,
                          serving: searchResult[index].serving,
                          rating:searchResult[index].rating,
                        ),
                        itemCount:searchResult.length
                    ),
                  ):Expanded(child: SingleChildScrollView(child: EmptySearch()));
                }
              } ,
            ),
          ],
        ),
      ),
    );
  }
}
