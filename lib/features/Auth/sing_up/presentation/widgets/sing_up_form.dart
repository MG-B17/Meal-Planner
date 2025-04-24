import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_planner/config/navigaation/navigation.dart';
import 'package:meal_planner/core/errors/errorStrings.dart';
import 'package:meal_planner/features/Auth/sing_up/presentation/controller/cubit.dart';
import 'package:meal_planner/features/Auth/sing_up/presentation/controller/state.dart';
import '../../../../../core/utilies/colors/color_manager.dart';
import '../../../../../core/utilies/strings/app_strings.dart';
import '../../../../../core/utilies/widgets/button.dart';
import '../../../../../core/utilies/widgets/error_dialog.dart';
import '../../../../../core/utilies/widgets/loading_dialog.dart';
import '../../../../../core/utilies/widgets/text_form_field.dart';
import '../../../../layout/presentation/pages/layout.dart';
import '../../../social_auth/widgets/social_login.dart';
import '../../../social_auth/widgets/welcome_tittle_and_sub_tittle.dart';

class SingUpForm extends StatelessWidget {
  SingUpForm({super.key});

 final TextEditingController fullNameController =TextEditingController();

 final TextEditingController emailController =TextEditingController();

 final TextEditingController phoneController =TextEditingController();

 final TextEditingController passwordController =TextEditingController();

  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateAccountCubit,CreateAccountState>(
      listener: (context,state){
        if(state is LoadingCreateAccount){
          showDialog(context: context, builder: (context)=>loadingDialog());
        }
        else if(state is CreateAccountFail){
          Navigator.pop(context);
          showDialog(context: context,builder: (context)=>errorDialog(errorMessage:state.errorMessage));
        }else if(state is CreateAccountSuccess){
          PushAndRemoveNavigation().navigation(context: context, screen: LayoutScreen());
        }
      },
      builder:(context,state){
        var cubit = CreateAccountCubit.get(context);
        return Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WelcomeTittleAndSubTittle(
                  tittle: AppStrings.createAccount,
                  subTittle:AppStrings.enterYourDetails
              ),
              MyTextFormField(
                  controller: fullNameController,
                  preFixIcon: Icons.person,
                  hintText: AppStrings.fullName,
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
                  controller: emailController,
                  preFixIcon: Icons.email,
                  hintText: AppStrings.email,
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
                  controller: phoneController,
                  preFixIcon: Icons.phone,
                  hintText: AppStrings.phone,
                  validation:(value){
                    if(value!.isEmpty){
                      return ErrorStrings.phoneValidation;
                    }else{
                      return null;
                    }
                  },
                  keyBoardType: TextInputType.phone
              ),
              MyTextFormField(
                  controller: passwordController,
                  preFixIcon: Icons.lock,
                  sufFixIcon:cubit.hideText ?Icons.visibility:Icons.visibility_off,
                  onTapSufFixIcon: (){
                    cubit.changeIcon();
                  },
                  hintText: AppStrings.password,
                  hideText:cubit.hideText,
                  validation:(value){
                    if(value!.isEmpty){
                      return ErrorStrings.passwordValidation;
                    }else{
                      return null;
                    }
                  },
                  keyBoardType: TextInputType.visiblePassword
              ),
              SizedBox(
                height: 10.h,
              ),
              MyButton(
                  text: AppStrings.login,
                  width: double.infinity,
                  onTap: (){
                    if(formKey.currentState!.validate()){
                      cubit.createAccount(
                          fullName: fullNameController.text,
                          email: emailController.text,
                          phone: phoneController.text,
                          password: passwordController.text
                      );
                    }
                  },
                  buttonColor: ColorManager.secondaryColor
              ),
              SizedBox(
                height: 20.h,
              ),
              SocialLogin()
            ],
          ),
        );
      } ,
    );
  }
}
