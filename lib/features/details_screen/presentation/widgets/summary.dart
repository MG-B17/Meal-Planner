import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utilies/colors/color_manager.dart';

class Summary extends StatelessWidget {
 Summary({super.key,required this.summary});
  String summary;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Text(
        summary,
        maxLines: 10,
        style: TextStyle(
            color: ColorManager.grey,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}
