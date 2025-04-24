import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utilies/colors/color_manager.dart';
import '../../../Auth/login/presentation/controller/cubit.dart';
import 'drawerWidgeta/unselectedDrawerPage.dart';

class LogOut extends StatelessWidget {
  const LogOut({super.key});

  @override
  Widget build(BuildContext context) {
    return UnselectedDrawerPage(
      image:"assets/icons/logout.png",
      text: "Logout",
      onTap:(){
      showDialog(
        context: context,
        builder: ((context) => AlertDialog(
          backgroundColor: ColorManager.primaryColor,
          icon: Icon(
            CupertinoIcons.exclamationmark_circle,
            color: Colors.red,
            size: 40.h,
          ),
          title: Text(
            'Logout?',
            style: TextStyle(
                color: ColorManager.red,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold
            ),
          ),
          content: Text(
            'Are you sure you want to Logout? you Will Lost All task',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: ColorManager.myBlack,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: Text('No',style: TextStyle(
                    color: ColorManager.myBlack,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold
                ),)),
            TextButton(
                onPressed: () {
                  LoginCubit.get(context).logOut(context);
                } ,
                child: Text('Yes',style:TextStyle(
                    color: ColorManager.red,
                    fontSize: 14.sp
                ),))
          ],
        )),
      );
    },
    );
  }
}
