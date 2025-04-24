import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utilies/colors/color_manager.dart';


class SelectedDrawerPage extends StatelessWidget {

  String image;

  String text;

  SelectedDrawerPage({required this.image,required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:EdgeInsets.only(top: 30.h,right: 20.w),
        child: Container(
          width: 303.w,
          height: 44.h,
          decoration: BoxDecoration(
              color: ColorManager.secondaryColor,
              borderRadius: BorderRadius.only(topRight: Radius.circular(41.r),bottomRight:Radius.circular(41.r) )
          ),
          child: Padding(
            padding:EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                Image(
                  image: AssetImage(image),
                  width: 40.w,
                  height: 40.h,
                  color: ColorManager.primaryColor,
                ),
                SizedBox(width: 10.w,),
                Text(
                  text,
                  style: TextStyle(
                      color: ColorManager.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}
