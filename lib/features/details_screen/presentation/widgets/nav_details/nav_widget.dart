

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_planner/core/utilies/strings/app_strings.dart';
import 'package:meal_planner/features/details_screen/presentation/widgets/nav_details/selected_icon.dart';
import 'package:meal_planner/features/details_screen/presentation/widgets/nav_details/unselected_icon.dart';

class NavWidget extends StatefulWidget {
NavWidget({super.key});

  @override
  State<NavWidget> createState() => _NavWidgetState();
}

class _NavWidgetState extends State<NavWidget> {
  int index=0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 10.w,
      children: [
        index==0?SelectedIcon(text: AppStrings.summary):UnselectedIcon(text: AppStrings.summary,onTap: (){
          setState(() {
            index=0;
          });
        },),
        index==1?SelectedIcon(text: AppStrings.ingredients):UnselectedIcon(text: AppStrings.ingredients,onTap: (){
          setState(() {
            index=1;
          });
        },),
        index==2?SelectedIcon(text: AppStrings.direction):UnselectedIcon(text: AppStrings.direction,onTap: (){
          setState(() {
            index=2;
          });
        },),
      ],
    );
  }
}
