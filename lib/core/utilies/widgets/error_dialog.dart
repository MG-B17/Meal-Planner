import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../colors/color_manager.dart';


AlertDialog errorDialog({required String errorMessage}){
  return AlertDialog(
    content: Container(
      width: 285.w,
      height: 140.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding:EdgeInsets.symmetric(vertical: 20.h,horizontal: 16.w),
            child: Icon(
              Icons.error,
              size: 50.sp,
              color: ColorManager.red,
            ),
          ),
          Text(errorMessage,style: TextStyle(color: ColorManager.red,fontSize: 18.sp),
          ),
        ],
      ),
    ),
  );
}