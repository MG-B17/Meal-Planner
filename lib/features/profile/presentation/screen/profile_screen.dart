import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_planner/core/utilies/colors/color_manager.dart';
import 'package:meal_planner/features/profile/presentation/widgets/form.dart';

class ProfileScreen extends StatelessWidget {
 const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical:10.h,horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 65.r,
                    backgroundImage: NetworkImage("https://pbs.twimg.com/profile_images/1902170237023481856/2P3eaRG1_400x400.jpg"),
                  ),
                  CircleAvatar(
                    backgroundColor: ColorManager.secondaryColor,
                    radius: 20.r,
                    child: IconButton(
                        onPressed: (){},
                        icon:Icon(
                          Icons.edit,
                          size: 20.sp,
                          color: ColorManager.primaryColor,
                        )
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
             ProfileForm()
            ],
          ),
        ),
      ),
    );
  }
}
