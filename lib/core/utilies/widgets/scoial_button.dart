import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors/color_manager.dart';

class SocialButton extends StatelessWidget {

 final String image;

 final String text;

 final void Function() onTap;

 final Color? imageColor;

 final Color borderColor;

 SocialButton({super.key,required this.text,required this.image,required this.onTap,this.imageColor=null,this.borderColor=ColorManager.primaryColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50.h,
        decoration: BoxDecoration(
            color: ColorManager.primaryColor,
            border: Border.all(width: 1.5.w,color: borderColor),
            borderRadius: BorderRadius.circular(10.r),
          boxShadow:  [
            BoxShadow(
              color: ColorManager.grey,
              offset: Offset(0, 2), // Adjust the shadow offset (horizontal, vertical)
              blurRadius: 4, // Adjust the blur radius
              spreadRadius: 2,
            )
          ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10.w,
          children: [
            Image(
              image: AssetImage(image),
              width: 25.w,
              height: 25.h,
              color:imageColor ,
              fit: BoxFit.cover,
            ),
            Text(
              text,
              style: TextStyle(
                  color: ColorManager.myBlack,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp
              ),
            )
          ],
        ),
      ),
    );
  }
}
