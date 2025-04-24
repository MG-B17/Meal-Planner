import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_planner/core/utilies/colors/color_manager.dart';
import 'package:meal_planner/core/utilies/strings/app_strings.dart';
import 'package:meal_planner/core/utilies/widgets/scoial_button.dart';
import 'package:meal_planner/features/intro/toggle/widget/image_with_burtton.dart';
import 'package:meal_planner/core/utilies/widgets/or_divider.dart';
import 'package:meal_planner/core/utilies/widgets/text_span.dart';

import '../../../config/navigaation/navigation.dart';
import '../../Auth/login/presentation/screens/login_screen.dart';

class ToggleScreen extends StatelessWidget {
  const ToggleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.secondaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ImageWithButton(),
            Padding(
              padding:EdgeInsets.symmetric(vertical: 10.h,horizontal: 16.w),
              child: Column(
                spacing: 15.h,
                children: [
                  OrDivider(
                    color: ColorManager.primaryColor,
                  ),
                  SocialButton(text: AppStrings.continueWithFaceBook, image: "assets/images/Facebook F.png",imageColor: Colors.indigo, onTap: (){}),
                  SocialButton(text: AppStrings.continueWithGoogle, image: "assets/images/Google.png", onTap: (){}),
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            textSpan(
                context: context,
                boldText: AppStrings.login,
                text:AppStrings.alreadyHaveAccount,
                textColor: ColorManager.primaryColor,
                onTap: (){
                  PushNavigation().navigation(context: context, screen: LoginScreen());
                }
                )
          ],
        ),
      ),
    );
  }
}
