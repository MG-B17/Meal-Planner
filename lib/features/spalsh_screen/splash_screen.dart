import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_planner/core/utilies/widgets/app_logo.dart';
import '../../core/utilies/colors/color_manager.dart';

class SplashScreen extends StatelessWidget {
SplashScreen({super.key,required this.nextScreen});

  Widget nextScreen;

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        duration: 3000,
        centered: true,
        splash:AppLogo(height: 180.h,width: 200.w,fontSize: 30.sp,),
        splashIconSize: 250.h,
        nextScreen: nextScreen,
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: ColorManager.secondaryColor);
  }
}
