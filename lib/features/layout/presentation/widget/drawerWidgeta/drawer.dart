import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_planner/features/Auth/login/presentation/controller/cubit.dart';
import 'package:meal_planner/features/layout/presentation/widget/drawerWidgeta/profileAndUserName.dart';
import 'package:meal_planner/features/layout/presentation/widget/drawerWidgeta/selectedDrawerPage.dart';
import 'package:meal_planner/features/layout/presentation/widget/drawerWidgeta/unselectedDrawerPage.dart';
import 'package:meal_planner/features/layout/presentation/widget/log_out.dart';
import '../../../../../core/utilies/colors/color_manager.dart';
import '../../manager/cubit.dart';


Drawer myDrawer({required int index,required context}){
  return Drawer(
    backgroundColor:ColorManager.primaryColor,
    child:Column(
      children: [
       ProfileAndUserName(image: "https://pbs.twimg.com/profile_images/1902170237023481856/2P3eaRG1_400x400.jpg", userName: "User Name"),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            index==0?SelectedDrawerPage(image:"assets/icons/Home.png", text: "Home"):UnselectedDrawerPage(image:"assets/icons/Home.png", text: "Home",onTap: (){
              LayoutCubit.get(context).changeScreen(index: 0);
            },),
            index==1?SelectedDrawerPage(image:"assets/icons/Fav.png", text: "Favorite"):UnselectedDrawerPage(image:"assets/icons/Fav.png", text: "Favorite",onTap: (){
              LayoutCubit.get(context).changeScreen(index: 1);
            },),
            index==2?SelectedDrawerPage(image:"assets/icons/Profile.png", text: "Profile"):UnselectedDrawerPage(image:"assets/icons/Profile.png", text: "Profile",onTap: (){
              LayoutCubit.get(context).changeScreen(index: 2);
            },),
            Padding(
              padding:EdgeInsets.symmetric(vertical: 20.h,horizontal: 16.w),
              child: Divider(
                height: 2.h,
                color:ColorManager.grey,
              ),
            ),
            LogOut()
          ],
        )
      ],
    ),
  );
}