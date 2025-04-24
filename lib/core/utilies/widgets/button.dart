import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../colors/color_manager.dart';

class MyButton extends StatelessWidget {

 final String text;

 final double width ;

 final void Function()? onTap;

 final Color buttonColor;

  MyButton({super.key,required this.text,required this.width,required this.onTap,required this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width:width,
        height: 45.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: buttonColor,
          boxShadow: [
            BoxShadow(
              color: ColorManager.grey,
              offset: Offset(0, 2), // Adjust the shadow offset (horizontal, vertical)
              blurRadius: 4, // Adjust the blur radius
              spreadRadius: 2,
            )
          ]
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: ColorManager.primaryColor,
                fontSize:16.sp,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}
