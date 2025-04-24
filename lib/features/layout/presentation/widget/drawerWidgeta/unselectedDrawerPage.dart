import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utilies/colors/color_manager.dart';

class UnselectedDrawerPage extends StatelessWidget {

  String text;

  String image;

  void Function()? onTap;

  UnselectedDrawerPage({required this.text,required this.image,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
          padding:EdgeInsets.only(top: 30.h,right: 20.w,left: 16.w),
          child: Row(
            children: [
              Image(
                image: AssetImage(image),
                width: 30.w,
                height: 30.h,
                color: ColorManager.secondaryColor,
              ),
              SizedBox(width: 10.w,),
              Text(
                text,
                style: TextStyle(
                    color: ColorManager.secondaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp
                ),
              )
            ],
          )
      ),
    );
  }
}
