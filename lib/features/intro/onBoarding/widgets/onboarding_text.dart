import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utilies/colors/color_manager.dart';
import '../../../../core/utilies/strings/app_strings.dart';

class OnboardingText extends StatelessWidget {
  const OnboardingText({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        spacing: 10.h,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            AppStrings.onBoardingTittles,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: ColorManager.myBlack,
                fontSize:18.sp,
                fontWeight: FontWeight.bold
            ),
          ),
          Text(
            AppStrings.onBoardingSubTittles,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey[700],
              fontSize:14.sp,
            ),
          ),
        ],
      ),
    );
  }
}
