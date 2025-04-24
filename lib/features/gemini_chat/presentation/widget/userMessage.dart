import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:meal_planner/core/utilies/colors/color_manager.dart';

class UserMessage extends StatelessWidget {

  String message;

  UserMessage({required this.message});

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: Duration(seconds: 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                  color: ColorManager.secondaryColor,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft:Radius.circular(10))
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  message,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
