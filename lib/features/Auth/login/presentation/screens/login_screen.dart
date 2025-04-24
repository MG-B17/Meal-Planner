import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_planner/config/navigaation/navigation.dart';
import 'package:meal_planner/core/utilies/colors/color_manager.dart';
import 'package:meal_planner/core/utilies/strings/app_strings.dart';
import 'package:meal_planner/core/utilies/widgets/app_logo.dart';
import 'package:meal_planner/core/utilies/widgets/text_span.dart';
import 'package:meal_planner/features/Auth/login/presentation/widgets/login_form.dart';
import 'package:meal_planner/features/Auth/sing_up/presentation/screens/sing_up_screen.dart';

class LoginScreen extends StatelessWidget {
 const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding:EdgeInsets.symmetric(horizontal: 12.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppLogo(width: 130.w,height: 110.h,fontSize:22.sp,textColor: ColorManager.secondaryColor,),
                  SizedBox(height: 15.h,),
                  LoginForm(),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    child: textSpan(
                        context: context,
                        boldText: AppStrings.singUp,
                        text:AppStrings.doNotHaveAccount,
                        textColor: ColorManager.myBlack,
                        onTap:(){
                          PushNavigation().navigation(context: context, screen:SingUpScreen());
                        }
                    ),
                  )
                ],
              ),
            ),
          )
      ),
    );
  }
}
