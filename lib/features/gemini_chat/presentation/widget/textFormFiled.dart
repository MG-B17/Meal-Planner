import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_planner/core/utilies/colors/color_manager.dart';

import '../../../../core/utilies/strings/app_strings.dart';

class GeminiTextFormFiled extends StatefulWidget {

  TextEditingController geminiController;

  void Function ()onTap;

  GeminiTextFormFiled({ required this.onTap,required this.geminiController});

  @override
  State<GeminiTextFormFiled> createState() => _GeminiTextFormFiledState();
}

class _GeminiTextFormFiledState extends State<GeminiTextFormFiled> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.all(10),
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight:Radius.circular(10) ),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: widget.geminiController,
                keyboardType: TextInputType.text,
                onChanged: (value){
                  setState(() {
                    widget.geminiController.text=value;
                  });
                },
                decoration: InputDecoration(
                    hintText: AppStrings.enterDishName,
                    helperStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 16.sp,
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    )
                ),
              ),
            ),
           widget.geminiController.text.isEmpty?Padding(
             padding:EdgeInsets.all(10.0.h),
             child:Image(
               image: AssetImage("assets/icons/unsendIcon.png"),
               width: 30.w,
               fit: BoxFit.cover,
             ),
           ):InkWell(
              onTap: widget.onTap,
              child: Padding(
                padding:EdgeInsets.all(10.0.h),
                child:Image(
                    image: AssetImage("assets/icons/sendIcon.png"),
                  width: 30.w,
                  color: ColorManager.secondaryColor,
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
