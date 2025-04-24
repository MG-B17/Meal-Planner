import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_planner/core/errors/errorStrings.dart';
import '../colors/color_manager.dart';

class UnexpectedErrorWidget extends StatelessWidget {
  const UnexpectedErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 450.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image:const AssetImage("assets/images/unexcpectedError.png"),
            width: 200.w,
            height: 200.h,
            fit: BoxFit.contain,
          ),
          Text(
            ErrorStrings.unexpectedError,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: ColorManager.red,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold
            ),
          )
        ],
      ),
    );
  }
}
