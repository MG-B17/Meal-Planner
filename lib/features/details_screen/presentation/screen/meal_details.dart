import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_planner/features/details_screen/presentation/widgets/meal_time_and_ingredients_num.dart';
import 'package:meal_planner/features/details_screen/presentation/widgets/nav_details/nav_widget.dart';
import 'package:meal_planner/features/details_screen/presentation/widgets/sliver_app_bar.dart';
import 'package:meal_planner/features/details_screen/presentation/widgets/summary.dart';
import '../../../../core/utilies/colors/color_manager.dart';
import '../widgets/natrations.dart';

class MealDetails extends StatelessWidget {
  
  MealDetails({
    super.key,
    required this.direction,
    required this.protein,
    required this.time,
    required this.serving,
    required this.ingredients,
    required this.name,
    required this.image,
    required this.tittle,
    required this.summary,
    required this.fat,
    required this.calories
  });

  String image;
  String name ;
  String tittle;
  String time;
  List ingredients;
  List direction;
  String summary;
  String serving ;
  String protein;
  String fat;
  String calories;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers:<Widget> [
          mySliverAppBar(context: context,image: image),
          SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: 1,
                      (context,index)=>Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Column(
                          spacing: 10.h,
                          children: [
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                              name,
                              textAlign: TextAlign.center,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: ColorManager.myBlack,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            MealTimeAndIngredientsNum(
                                name: tittle,
                                totalTime:time,
                                serving: "$serving Serving"
                            ),
                            NavWidget(),
                            Summary(summary: summary),
                            NutrationsWidget(fat: fat, calories: calories, protein: protein)
                          ],
                        ),
                      )
              )
          )
        ],
      ),
    );
  }
}
