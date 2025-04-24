import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../colors/color_manager.dart';
import '../strings/app_strings.dart';

class AppLogo extends StatelessWidget {
 AppLogo({super.key,required this.width,required this.height,required this.fontSize,this.textColor=ColorManager.primaryColor});

 final double width;
 final double height;
 final double fontSize;
 final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Column(// Ensure children are centered properly
      children: [
        SizedBox(
          width: width,
          height: height,
          child: Lottie.asset(
            "assets/images/animation.json",
            fit: BoxFit.contain,
            width: double.infinity,
            repeat: false,
          ),
        ), // Space between animation and text
        DefaultTextStyle(
          style: TextStyle(
            fontSize:fontSize,
            color:textColor,
            fontWeight: FontWeight.bold,
          ),
          child: AnimatedTextKit(
            animatedTexts: [
              WavyAnimatedText(AppStrings.appName),
            ],
            isRepeatingAnimation: false,
            onTap: () {
            },
          ),
        ),
      ],
    );
  }
}
