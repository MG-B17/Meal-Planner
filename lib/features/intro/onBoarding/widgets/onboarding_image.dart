import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utilies/strings/app_strings.dart';

class OnboardingImage extends StatelessWidget {
  PageController controller;
  void Function(int)? onPageChange;
   OnboardingImage({super.key,required this.controller,required this.onPageChange});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
          controller: controller,
          onPageChanged: onPageChange,
          itemCount: AppStrings.onBoardingImage.length,
          itemBuilder: (context ,index)=>Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:EdgeInsets.symmetric(vertical: 20.h),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(20.r),bottomRight:Radius.circular(20.r) )
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Image(
                    image: AssetImage(AppStrings.onBoardingImage[index]),
                    width: 300.w,
                    height: 300.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          )
      ),
    );
  }
}
