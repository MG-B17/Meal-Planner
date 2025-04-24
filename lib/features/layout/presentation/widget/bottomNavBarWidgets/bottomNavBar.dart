import 'package:flutter/material.dart';
import '../../manager/cubit.dart';
import 'bottomNavBarSelectedIcon.dart';
import 'bottomNavBarUnselectedIcon.dart';

Widget myBottomNavigationBar({required int index,required context}){
  return BottomNavigationBar(
      currentIndex:LayoutCubit.get(context).currentIndex,
      onTap: (value){
        LayoutCubit.get(context).changeScreen(index: value);
      },
      items: [
        BottomNavigationBarItem(
            icon:index ==0? BottomNavbarSelectedIcon(image:"assets/icons/Home.png"):BottomNavBarUnselectedIcon(image: "assets/icons/Home.png"),
            label: "Home"
        ),
        BottomNavigationBarItem(
            icon:index==1? BottomNavbarSelectedIcon(image:"assets/icons/Fav.png"):BottomNavBarUnselectedIcon(image: "assets/icons/Fav.png"),
            label: "Favorite"
        ),
        BottomNavigationBarItem(
            icon: index ==2?BottomNavbarSelectedIcon(image:"assets/icons/Profile.png"):BottomNavBarUnselectedIcon(image: "assets/icons/Profile.png"),
            label: "Profile"
        )
      ]
  );
}