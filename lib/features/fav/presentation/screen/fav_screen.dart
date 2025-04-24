import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_planner/core/utilies/widgets/unexpected_error.dart';
import 'package:meal_planner/features/fav/presentation/controller/cubit.dart';
import 'package:meal_planner/features/fav/presentation/controller/state.dart';
import 'package:meal_planner/features/fav/presentation/widgets/empty_fav.dart';
import 'package:meal_planner/features/fav/presentation/widgets/fav_item.dart';

class FavScreen extends StatelessWidget {
 const FavScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavCubit,FavStates>(
      listener: (context,state){},
      builder: (context,state){
        if (state is GetFavSuccess){
          return state.favMealEntity.isNotEmpty?Padding(
            padding:EdgeInsets.symmetric(vertical: 8.h,horizontal: 16.w),
            child: Column(
              children: [
                 Expanded(
                    child:ListView.separated(
                        itemBuilder: (context,index)=>FavItem(
                          image:state.favMealEntity[index].image,
                          time:state.favMealEntity[index].totalTime,
                          itemName:state.favMealEntity[index].name,
                          id:state.favMealEntity[index].id,
                          rating:state.favMealEntity[index].rating,
                          fat:state.favMealEntity[index].fat,
                          protein:state.favMealEntity[index].protein,
                          calories:state.favMealEntity[index].calories ,
                          tittle:state.favMealEntity[index].tittle,
                          summary:state.favMealEntity[index].summary,
                          serving: state.favMealEntity[index].serving,
                        ),
                        separatorBuilder: (context,index)=>SizedBox(height: 12.h,),
                        itemCount: state.favMealEntity.length
                    )
                ),
              ],
            ),
          ):EmptyFav();
        }else{
          return UnexpectedErrorWidget();
        }
      },

    );
  }
}
