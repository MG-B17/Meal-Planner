import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utilies/colors/color_manager.dart';

class WelcomeTittleAndSubTittle extends StatelessWidget {
 WelcomeTittleAndSubTittle({super.key,required this.tittle,required this.subTittle});

 String tittle;

 String subTittle;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tittle,
          textAlign: TextAlign.start,
          style: TextStyle(
              color: ColorManager.myBlack,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(
          height: 3.h,
        ),
        Text(
          subTittle,
          textAlign: TextAlign.start,
          style: TextStyle(
            color: ColorManager.grey,
            fontSize: 16.sp,
          ),
        ),
        SizedBox(
          height: 3.h,
        ),
      ],
    );
  }
}
