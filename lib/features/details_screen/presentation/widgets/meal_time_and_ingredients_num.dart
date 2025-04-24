import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utilies/colors/color_manager.dart';

class MealTimeAndIngredientsNum extends StatelessWidget {
 MealTimeAndIngredientsNum({super.key,required this.name,required this.totalTime,required this.serving});
  String name;
  String totalTime;
  String serving;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: ColorManager.grey,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Text(
            "|",
            style: TextStyle(
                color: ColorManager.myBlack,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        Text(
          "$totalTime min",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: ColorManager.grey,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Text(
            "|",
            style: TextStyle(
                color: ColorManager.myBlack,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        Text(
          serving,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: ColorManager.grey,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold
          ),
        )
      ],
    );
  }
}
