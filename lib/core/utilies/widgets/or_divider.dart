import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../strings/app_strings.dart';

class OrDivider extends StatelessWidget {
  OrDivider({super.key,required this.color});

 final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10.w,
      children: [
        Expanded(
          child: Divider(
            color: color,
            height: 2.2.h,
          ),
        ),
        Text(
          AppStrings.orUseSocialSingUp,
          style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 14.sp
          ),
        ),
        Expanded(
          child: Divider(
            color: color,
            height: 2.2.h,
          ),
        )
      ],
    );
  }
}
