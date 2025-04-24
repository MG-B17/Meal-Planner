import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utilies/colors/color_manager.dart';

class BottomNavbarSelectedIcon extends StatelessWidget {

  String image;

  BottomNavbarSelectedIcon({required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 60.w,
        height: 50.h,
        decoration: BoxDecoration(
            color: ColorManager.secondaryColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.4),
                spreadRadius: 5.r,
                blurRadius: 5.r,
                offset: Offset(0, 3),
              )
            ],
            borderRadius: BorderRadius.circular(50.r)
        ),
        child:Image(
          image: AssetImage(image),
          width: 30.w,
          height: 30.h,
          color: ColorManager.primaryColor,
        )) ;
  }
}
