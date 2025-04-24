import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utilies/colors/color_manager.dart';
import '../../../../core/utilies/strings/app_strings.dart';

class EmptyChatWidget extends StatelessWidget {
  const EmptyChatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 450.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image:const AssetImage("assets/images/ai.png"),
            width: 200.w,
            height: 200.h,
            fit: BoxFit.contain,
          ),
          Text(
            AppStrings.geminiEmptyChat,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: ColorManager.myBlack,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold
            ),
          )
        ],
      ),
    );
  }
}
