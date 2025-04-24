import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_planner/core/utilies/strings/app_strings.dart';

import '../../../../core/utilies/colors/color_manager.dart';

class NutrationsWidget extends StatelessWidget {
 NutrationsWidget({super.key,required this.fat,
   required this.calories,required this.protein});

 String protein;
 String fat;
 String calories;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8.h,
      children: [
        Text(
          AppStrings.nutrations,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: ColorManager.secondaryColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                width:90.w,
                height:90.w,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: ColorManager.secondaryColor,width: 4.w)
                ),
                child: Center(
                  child: Text(
                    "$protein protein",
                    style: TextStyle(
                        color: ColorManager.secondaryColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width:90.w,
                height:90.w,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: ColorManager.secondaryColor,width: 4.w)
                ),
                child: Center(
                  child: Text(
                    "$fat  fat",
                    style: TextStyle(
                        color: ColorManager.secondaryColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width:90.w,
                height:90.w,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: ColorManager.secondaryColor,width: 4.w)
                ),
                child: Center(
                  child: Text(
                    "$calories\ncalories",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: ColorManager.secondaryColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 15.h,
        )
      ],
    );
  }
}
