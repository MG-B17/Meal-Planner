import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_planner/core/utilies/colors/color_manager.dart';
import 'package:meal_planner/features/fav/presentation/controller/cubit.dart';
import 'package:meal_planner/features/fav/presentation/controller/state.dart';
import 'package:meal_planner/core/utilies/widgets/rating_bar.dart';
import 'package:meal_planner/features/details_screen/presentation/screen/meal_details.dart';

import '../../../../config/navigaation/navigation.dart';

class MealIcon extends StatelessWidget {
 MealIcon({
   super.key,
   required this.imageUrl,
   required this.protein,
   required this.calories,
   required this.serving,
   required this.summary,
   required this.tittle,
   required this.isFav ,
   required this.mealTittle,
   required this.time,
   required this.rating,
   required this.onTap,
   required this.fat
 });

  String imageUrl;
  String mealTittle;
  String time;
  double rating ;
  void Function()? onTap;
  bool isFav;
  String tittle;
  String serving;
  String summary;
  String protein;
  String fat;
  String calories;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavCubit,FavStates>(
      listener: (context,state){},
      builder: (context,state){
        return InkWell(
          onTap: (){
            PushNavigation().navigation(context: context, screen:
            MealDetails(
              direction:[],
              ingredients:[],
              name: mealTittle,
              image: imageUrl,
              tittle: tittle,
              summary: summary,
              time: time,
              fat: fat,
              protein: protein,
              calories: calories,
              serving: serving,
            ));
          },
            onLongPress: onTap,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h,horizontal: 16),
            child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: 180.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    boxShadow: [ // boxShadow expects a List<BoxShadow>
                      BoxShadow(
                        color: ColorManager.grey, // Customize the shadow color
                        offset: Offset(1, 3), // Adjust the shadow offset (horizontal, vertical)
                        blurRadius: 4, // Adjust the blur radius
                        spreadRadius: 3, // Adjust the spread radius
                      ),
                    ]
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder:(context,error,stackBack)=>Image.asset("assets/images/unexcpectedError.png",fit: BoxFit.cover,),
                ),
              ),
              Container(
                height: 180.h, // Match the image height
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(138, 71, 235, 1),
                      Colors.white.withOpacity(.12),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    stops:  [0.2, .65],
                  ),
                ),
              ),
              Padding(
                padding:EdgeInsets.symmetric(vertical: 8.h,horizontal: 12.w),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            mealTittle,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "$time min",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.white
                            ),
                          ),

                        ],
                      ),
                    ),
                    SizedBox(width: 5.w,),
                    Rating(rating: rating,),
                  ],),
              ),
            ],
                      ),
          ));
      },
    );
  }
}