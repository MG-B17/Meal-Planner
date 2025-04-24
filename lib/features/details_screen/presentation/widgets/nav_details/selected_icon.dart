import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utilies/colors/color_manager.dart';

class SelectedIcon extends StatelessWidget {
 SelectedIcon({super.key,required this.text});

  String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 3.h,
      children: [
        Text(
          text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: ColorManager.secondaryColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold
          ),
        ),
        Container(
          height: 5.h,
          width:30.w ,
          decoration: BoxDecoration(
              color: ColorManager.secondaryColor,
              borderRadius:BorderRadius.horizontal(right: Radius.circular(17.r),left:Radius.circular(17.r) )
          ),
        )
      ],
    );
  }
}
