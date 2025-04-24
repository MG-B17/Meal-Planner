import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utilies/colors/color_manager.dart';

SliverAppBar mySliverAppBar ({required context,required String image}){
  return SliverAppBar(
    pinned: true,
    floating: false,
    expandedHeight: 280.h,
    leading: Padding(
      padding:EdgeInsets.symmetric(horizontal: 5.w),
      child: InkWell(
        onTap: (){
          Navigator.pop(context);
        },
        child: CircleAvatar(
          backgroundColor: ColorManager.primaryColor,
          radius: 20.r,
          child:Center(
            child: Icon(
                  Icons.arrow_back_ios_new,
                  color: ColorManager.secondaryColor,
                  size: 22.h,
                ),
          ),
        ),
      ),
    ),
    flexibleSpace: FlexibleSpaceBar(
      background: Image.network(
        image,
        width: double.infinity,
        height: 280.h,
        fit: BoxFit.cover,
        errorBuilder: (context,error,stackTrace)=>const SizedBox(),
      ),
    ),
  );
}