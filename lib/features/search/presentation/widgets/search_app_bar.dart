import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utilies/colors/color_manager.dart';
import '../../../../core/utilies/strings/app_strings.dart';

AppBar searchAppBar (context){
  return AppBar(
    leading: IconButton(
        onPressed: (){
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back_ios,
          size: 22.sp,
          color: ColorManager.myBlack,
        )
    ),
    centerTitle: true,
    title: Text(
      AppStrings.search,
      style: TextStyle(
          color: ColorManager.myBlack,
          fontWeight: FontWeight.bold,
          fontSize: 20.sp
      ),
    ),
  );
}