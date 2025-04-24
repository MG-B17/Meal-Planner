import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_planner/core/utilies/colors/color_manager.dart';

class MyTextFormField extends StatelessWidget {

final IconData preFixIcon;

 final IconData? sufFixIcon;

 final void Function()? onTapSufFixIcon;

 final String hintText;

 final bool hideText;

 final TextEditingController controller;

 final String? Function(String?)? validation ;

 final TextInputType keyBoardType;

 final void Function()? onTap;

  final String? initialValue;

 final void Function(String)? onFiledSubmit;

  MyTextFormField({
    required this.controller,
    required this.preFixIcon,
    this.sufFixIcon,
    this.onTapSufFixIcon,
    required this.hintText,
    this.hideText=false,
    required this.validation,
    required this.keyBoardType,
    this.onTap,
    this.onFiledSubmit,
    this.initialValue
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.symmetric(vertical: 10.h),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          boxShadow: [
            BoxShadow(
              color: ColorManager.grey, // Customize the shadow color
              offset: Offset(0, 2), // Adjust the shadow offset (horizontal, vertical)
              blurRadius: 4,
              spreadRadius: 2,
            )
          ]
        ),
        child: TextFormField(
          onTap: onTap,
          initialValue:initialValue,
          onFieldSubmitted:onFiledSubmit ,
          controller:controller,
          obscureText:hideText,
          validator:validation,
          keyboardType: keyBoardType,
          decoration: InputDecoration(
            filled: true,
            fillColor: ColorManager.primaryColor,
            enabledBorder:OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: BorderSide(
                    color: ColorManager.grey
                )
            ) ,
            focusedBorder:OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: BorderSide(
                    color: ColorManager.secondaryColor
                )
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
              borderSide: BorderSide(
                color: ColorManager.red
              )
            ),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: BorderSide(
                    color: ColorManager.red
                )
            ),
            prefixIcon: Icon(
             preFixIcon ,
            color: ColorManager.grey,
            size: 24.sp,
            ),
            suffixIcon: IconButton(
                onPressed: onTapSufFixIcon,
                icon: Icon(
                  sufFixIcon,
                  color: ColorManager.grey,
                  size: 24.sp,
                )
            ),
            hintText: hintText,
            hintStyle: TextStyle(
              color: ColorManager.grey,
              fontSize: 16.sp,
            )
          ),
        ),
      ),
    );
  }
}
