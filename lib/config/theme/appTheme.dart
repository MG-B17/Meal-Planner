import 'package:flutter/material.dart';
import 'package:meal_planner/core/utilies/colors/color_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData appTheme(){
  return ThemeData(
    scaffoldBackgroundColor: ColorManager.primaryColor,
      appBarTheme: AppBarTheme(
        color: ColorManager.primaryColor,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: ColorManager.primaryColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedIconTheme: IconThemeData(
            color:ColorManager.secondaryColor,
            size: 24.sp
        ),
        selectedIconTheme: IconThemeData(
            color: ColorManager.primaryColor,
            size: 26.sp
        ),
      )
  );
}