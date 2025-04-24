import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_planner/features/profile/presentation/controller/cubit.dart';
import 'package:meal_planner/features/profile/presentation/controller/state.dart';

import '../../../../../core/utilies/colors/color_manager.dart';

class ProfileAndUserName extends StatelessWidget {

  String image ;

  String userName;

  ProfileAndUserName({required this.image,required this.userName});

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<ProfileCubit,ProfileState>(
      listener: (context,state){},
      builder: (context,state){
        return Container(
          height:157.h ,
          width:303.w ,
          color: ColorManager.secondaryColor,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h,horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40.r,
                  backgroundColor: ColorManager.grey,
                  backgroundImage: NetworkImage(image),
                ),
                SizedBox(width: 16.w,),
               state is GetProfileDataSuccess? Text(
                  state.userEntity.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style:TextStyle(
                      color: ColorManager.primaryColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold
                  ),
                ):SizedBox()
              ],
            ),
          ),
        );
      },
    );
  }
}
