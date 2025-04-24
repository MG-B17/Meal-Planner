import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_planner/config/navigaation/navigation.dart';
import 'package:meal_planner/features/Auth/sing_up/presentation/screens/sing_up_screen.dart';
import '../../../../core/utilies/colors/color_manager.dart';
import '../../../../core/utilies/strings/app_strings.dart';
import '../../../../core/utilies/widgets/button.dart';

class ImageWithButton extends StatelessWidget {
  const ImageWithButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image(
          height: 410.h,
          image: const AssetImage("assets/images/toggle.png"),
          fit: BoxFit.cover,
        ),
        Container(
          height: 410.h, // Match the image height
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(138, 71, 235, 1),
                Colors.white.withOpacity(.12),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: const [0.12, .8],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 16.w),
          child: MyButton(
            text: AppStrings.singUpWithEmail,
            buttonColor: ColorManager.myBlack,
            width: double.infinity,
            onTap: () {
              PushAndRemoveNavigation().navigation(context: context, screen: SingUpScreen());
            },
          ),
        ),
      ],
    );
  }
}
