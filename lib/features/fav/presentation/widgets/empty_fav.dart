import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_planner/core/utilies/strings/app_strings.dart';
import '../../../../core/utilies/colors/color_manager.dart';

class EmptyFav extends StatelessWidget {
  const EmptyFav({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 450.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image:const AssetImage("assets/images/noData.png"),
            width: 250.w,
            height: 250.h,
            fit: BoxFit.contain,
          ),
          Text(
            AppStrings.favIsEmpty,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: ColorManager.myBlack,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold
            ),
          )
        ],
      ),
    );
  }
}
