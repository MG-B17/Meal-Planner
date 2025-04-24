import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utilies/colors/color_manager.dart';
import '../../../../core/utilies/strings/app_strings.dart';

class EmptySearch extends StatelessWidget {
  const EmptySearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: SizedBox(
        width: double.infinity,
        height: 450.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image:const AssetImage("assets/images/search.png"),
              width: 250.w,
              height: 250.h,
              fit: BoxFit.contain,
            ),
            Text(
              AppStrings.emptySearch,
              maxLines: 3,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: ColorManager.myBlack,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold
              ),
            )
          ],
        ),
      ),
    );
  }
}
