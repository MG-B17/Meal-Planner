import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_planner/core/utilies/widgets/loading.dart';
import 'package:meal_planner/features/profile/presentation/controller/cubit.dart';
import 'package:meal_planner/features/profile/presentation/controller/state.dart';
import '../../../../core/errors/errorStrings.dart';
import '../../../../core/utilies/colors/color_manager.dart';
import '../../../../core/utilies/strings/app_strings.dart';
import '../../../../core/utilies/widgets/button.dart';
import '../../../../core/utilies/widgets/text_form_field.dart';

class ProfileForm extends StatelessWidget {

  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit,ProfileState>(
      listener: (context,state){},
      builder: (context,state){
        if(state is GetProfileDataSuccess){
          TextEditingController nameController =TextEditingController(text:state.userEntity.email);
          TextEditingController emailController =TextEditingController(text:state.userEntity.name);
          TextEditingController phoneController =TextEditingController(text:state.userEntity.phone);
          return Form(
            key: formKey,
            child: Column(
              children: [
                MyTextFormField(
                    controller:nameController,
                    preFixIcon:Icons.person,
                    hintText:AppStrings.fullName,
                    validation:(value){
                      if(value!.isEmpty){
                        return ErrorStrings.fullNameValidation;
                      }else{
                        return null;
                      }
                    },
                    keyBoardType: TextInputType.name
                ),
                MyTextFormField(
                    controller:emailController,
                    preFixIcon:Icons.email,
                    hintText:AppStrings.email,
                    validation:(value){
                      if(value!.isEmpty){
                        return ErrorStrings.emailValidation;
                      }else{
                        return null;
                      }
                    },
                    keyBoardType: TextInputType.emailAddress
                ),
                MyTextFormField(
                    controller:phoneController,
                    preFixIcon:Icons.phone,
                    hintText:AppStrings.phone,
                    validation:(value){
                      if(value!.isEmpty){
                        return ErrorStrings.phoneValidation;
                      }else{
                        return null;
                      }
                    },
                    keyBoardType: TextInputType.phone
                ),
                Padding(
                  padding:EdgeInsets.symmetric(vertical:10.h),
                  child: MyButton(
                      text: AppStrings.update,
                      width: double.infinity,
                      onTap:(){
                        if(formKey.currentState!.validate()){
                          ProfileCubit.get(context).updateProfile(name: nameController.text, email: emailController.text, phone: phoneController.text,context: context);
                        }
                      },
                      buttonColor: ColorManager.secondaryColor
                  ),
                ),
              ],
            ),
          );
        }else if (state is LoadingGetProfileData || state is LoadingUpdateProfile){
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 60.h),
            child: Center(child: spinKit,),
          );
        }
        else{
          return Form(
            key: formKey,
            child: Column(
              children: [
                MyTextFormField(
                    controller:TextEditingController(),
                    preFixIcon:Icons.person,
                    hintText:AppStrings.fullName,
                    validation:(value){
                      if(value!.isEmpty){
                        return ErrorStrings.fullNameValidation;
                      }else{
                        return null;
                      }
                    },
                    keyBoardType: TextInputType.name
                ),
                MyTextFormField(
                    controller:TextEditingController(),
                    preFixIcon:Icons.email,
                    hintText:AppStrings.email,
                    validation:(value){
                      if(value!.isEmpty){
                        return ErrorStrings.emailValidation;
                      }else{
                        return null;
                      }
                    },
                    keyBoardType: TextInputType.emailAddress
                ),
                MyTextFormField(
                    controller:TextEditingController(),
                    preFixIcon:Icons.phone,
                    hintText:AppStrings.phone,
                    validation:(value){
                      if(value!.isEmpty){
                        return ErrorStrings.phoneValidation;
                      }else{
                        return null;
                      }
                    },
                    keyBoardType: TextInputType.phone
                ),
                Padding(
                  padding:EdgeInsets.symmetric(vertical:10.h),
                  child: MyButton(
                      text: AppStrings.update,
                      width: double.infinity,
                      onTap:(){},
                      buttonColor: ColorManager.secondaryColor
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
