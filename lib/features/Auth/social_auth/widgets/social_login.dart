import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_planner/features/Auth/social_auth/logic/controller/cubit.dart';
import 'package:meal_planner/features/Auth/social_auth/logic/controller/state.dart';

import '../../../../config/navigaation/navigation.dart';
import '../../../../core/utilies/colors/color_manager.dart';
import '../../../../core/utilies/strings/app_strings.dart';
import '../../../../core/utilies/widgets/error_dialog.dart';
import '../../../../core/utilies/widgets/loading_dialog.dart';
import '../../../../core/utilies/widgets/or_divider.dart';
import '../../../../core/utilies/widgets/scoial_button.dart';
import '../../../layout/presentation/pages/layout.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SocialCubit>(
      create: (context)=>SocialCubit(),
      child: BlocConsumer<SocialCubit,SocialSingInState>(
        listener: (context,state){
          if(state is LoadingSingIn){
            showDialog(context: context, builder: (context)=>loadingDialog());
          }else if (state is SingInFail){
            Navigator.pop(context);
            showDialog(context: context,builder: (context)=>errorDialog(errorMessage:state.message));
          }else if (state is SingInSuccess){
            PushAndRemoveNavigation().navigation(context: context, screen: LayoutScreen());
          }
        },
        builder:(context,state){
          var cubit = SocialCubit.get(context);
          return Column(
            spacing: 15.h,
            children: [
              OrDivider(color: ColorManager.grey),
              SocialButton(text: AppStrings.continueWithFaceBook,borderColor: ColorManager.grey, image: "assets/images/Facebook F.png",imageColor: Colors.indigo, onTap: (){}),
              SocialButton(text: AppStrings.continueWithGoogle,borderColor: ColorManager.grey, image: "assets/images/Google.png", onTap: (){
                cubit.googleSingIn();
              }),
            ],
          );
        } ,
      ),
    );
  }
}
