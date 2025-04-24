import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utilies/colors/color_manager.dart';

class UnselectedIcon extends StatelessWidget {
   UnselectedIcon({super.key,required this.text,required this.onTap});

  String text;

  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed:onTap,
      child: Text(
        text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            color: ColorManager.grey,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}
