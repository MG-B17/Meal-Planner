import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_planner/config/navigaation/navigation.dart';
import 'package:meal_planner/features/details_screen/presentation/screen/meal_details.dart';
import 'package:meal_planner/features/fav/presentation/controller/cubit.dart';
import '../../../../core/utilies/colors/color_manager.dart';
import '../../../../core/utilies/widgets/rating_bar.dart';

class FavItem extends StatelessWidget {
 FavItem({
   super.key,
   required this.image,
   required this.time,
   required this.itemName,
   required this.rating,
   required this.id ,
   required this.tittle,
   required this.summary,
   required this.serving,
   required this.fat,
   required this.calories,
   required this.protein
 });

  String image ;
  double rating;
  String time;
  String itemName;
  int id ;
  String protein;
  String fat;
  String calories;
  String tittle;
  String summary;
  String serving;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        PushNavigation().navigation(
            context: context,
            screen: MealDetails(
                direction: [],
                protein: protein,
                time: time,
                serving: serving,
                ingredients: [],
                name: itemName,
                image: image,
                tittle: tittle,
                summary: summary,
                fat: fat,
                calories: calories
            ));
      },
      child: Container(
        height: 114.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorManager.primaryColor,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color:ColorManager.grey,width: 1.w),
          boxShadow: [ // boxShadow expects a List<BoxShadow>
            BoxShadow(
              color: ColorManager.grey, // Customize the shadow color
              offset: Offset(0, 2), // Adjust the shadow offset (horizontal, vertical)
              blurRadius: 4, // Adjust the blur radius
              spreadRadius: 2, // Adjust the spread radius
            ),
          ],
        ),
        child:Padding(
          padding:EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
          child: Row(
            children: [
              Container(
                width: 100.w,
                height: 100.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r)
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child:Image.network(
                  image,
                  fit: BoxFit.cover,
                  errorBuilder:(context,error,stackBack)=>Image.asset("assets/images/unexcpectedError.png",fit: BoxFit.cover,),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 5.h,
                  children: [
                    Text(
                      itemName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: ColorManager.secondaryColor
                      ),
                    ) ,
                    Text(
                      "$time",
                      style: TextStyle(
                          color: ColorManager.secondaryColor,
                          fontSize: 18.sp
                      ),
                    ),
                    Rating(rating: rating,),
                  ],
                ),
              ),
              Column(
                children: [
                  InkWell(
                    onTap: (){
                      FavCubit.get(context).removeFavMeal(context:context,id: id);
                    },
                    child: CircleAvatar(
                      backgroundColor: ColorManager.red,
                      radius: 16.r,
                      child: Icon(
                        Icons.cancel_outlined,
                        color: ColorManager.primaryColor,
                        size: 22.sp,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ) ,
      ),
    );
  }
}
