import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Text textSpan({required context, required String boldText, required String text,required Color textColor,required void Function() onTap}){
  return Text.rich(
      TextSpan(
          text: text,
          style: TextStyle(
            color: textColor,
            fontSize: 18.sp,
          ),
          children: [
            TextSpan(
                text:boldText,
                style: TextStyle(
                    color: textColor,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold
                ),
                recognizer: TapGestureRecognizer()..onTap=onTap
            )
          ]
      )
  );
}