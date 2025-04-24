import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../core/utilies/colors/color_manager.dart';

SmoothPageIndicator smoothPageIndicator ({required controller}){
  return SmoothPageIndicator(
    controller: controller,
    count:  2,
    axisDirection: Axis.horizontal,
    effect:ExpandingDotsEffect(
        spacing:8.0.w,
        radius:19.0.r,
        dotWidth:10.w,
        dotHeight:8.h,
        paintStyle:PaintingStyle.fill,
        strokeWidth:  1,
        dotColor:  Colors.grey,
        activeDotColor:  ColorManager.secondaryColor
    ),
  );
}