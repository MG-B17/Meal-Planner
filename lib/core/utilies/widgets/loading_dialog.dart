import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../colors/color_manager.dart';
import '../strings/app_strings.dart';
import 'loading.dart';

AlertDialog loadingDialog(){
  return AlertDialog(
    backgroundColor: ColorManager.primaryColor,
    content: Container(
      width: 285.w,
      height: 140.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding:EdgeInsets.symmetric(vertical: 20.h,horizontal: 16.w),
            child: spinKit,
          ),
          Text(
            AppStrings.pleaseWait,
            style: TextStyle(
                color: ColorManager.secondaryColor,
                fontSize: 18.sp
            ),
          )
        ],
      ),
    ),);
}