import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utilies/colors/color_manager.dart';


class BottomNavBarUnselectedIcon extends StatelessWidget {

  String image;
  BottomNavBarUnselectedIcon({required this.image});

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage(image),
      width: 25.w,
      height: 25.h,
      color: ColorManager.secondaryColor,
    );
  }
}
