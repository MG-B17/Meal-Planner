import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_planner/core/helper/cacheHelper/cache_helper.dart';
import 'package:meal_planner/core/helper/firebase_helper/firebase_key.dart';
import 'package:meal_planner/core/utilies/colors/color_manager.dart';
import 'package:meal_planner/core/utilies/strings/app_strings.dart';
import 'package:meal_planner/core/utilies/widgets/button.dart';
import 'package:meal_planner/features/intro/onBoarding/widgets/onboarding_image.dart';
import 'package:meal_planner/features/intro/onBoarding/widgets/onboarding_text.dart';
import 'package:meal_planner/features/intro/onBoarding/widgets/smooth_page_indcator.dart';
import 'package:meal_planner/features/intro/toggle/toggle_screen.dart';

import '../../../config/navigaation/navigation.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController controller=PageController();

  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child:Column(
            children: [
              OnboardingImage(
                controller: controller,
                onPageChange: (value){
                  if(value==AppStrings.onBoardingImage.length-1){
                    setState(() {
                      isLast=true;
                    });
                  }else{
                    setState(() {
                      isLast=false;
                    });
                  }
                },
              ),
              OnboardingText(),
              Padding(
                padding:EdgeInsets.symmetric(horizontal: 30.w,vertical:50.h),
                child: Row(
                  children: [
                    smoothPageIndicator(controller: controller),
                    const Spacer(),
                    MyButton(
                      width: 100.w,
                      buttonColor: ColorManager.secondaryColor,
                      text: AppStrings.next,
                      onTap: (){
                        if(isLast){
                         PushAndRemoveNavigation().navigation(context: context, screen: ToggleScreen());
                         CacheHelper.setData(key: onBoardingKey, value: true);
                        }else{
                          controller.nextPage(duration: Duration(milliseconds: 750), curve: Curves.easeInOut);
                        }
                    },)
                  ],
                ),
              )
            ],
          )
      ),
    );
  }
}
