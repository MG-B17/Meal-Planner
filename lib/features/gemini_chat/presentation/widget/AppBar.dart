import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utilies/colors/color_manager.dart';
import '../../../../core/utilies/strings/app_strings.dart';

AppBar GeminiAppBar({required context}){
  return AppBar(
    leading: IconButton(
        onPressed: (){
          Navigator.pop(context);
          },
        icon: Icon(
          Icons.arrow_back_ios,
          color: ColorManager.secondaryColor,
          size: 24.sp,
        )
    ),
    title: Text(
      AppStrings.gemini,
      style: TextStyle(
          color: ColorManager.secondaryColor,
          fontSize: 25,
          fontWeight: FontWeight.bold
      ),
    ),
    centerTitle: true,
  );
}