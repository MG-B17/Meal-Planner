import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_planner/config/navigaation/navigation.dart';
import 'package:meal_planner/core/errors/errorStrings.dart';
import 'package:meal_planner/features/Auth/login/presentation/controller/cubit.dart';
import 'package:meal_planner/features/Auth/login/presentation/controller/state.dart';
import '../../../../../core/utilies/colors/color_manager.dart';
import '../../../../../core/utilies/strings/app_strings.dart';
import '../../../../../core/utilies/widgets/button.dart';
import '../../../../../core/utilies/widgets/error_dialog.dart';
import '../../../../../core/utilies/widgets/loading_dialog.dart';
import '../../../../../core/utilies/widgets/text_form_field.dart';
import '../../../../layout/presentation/pages/layout.dart';
import '../../../social_auth/widgets/social_login.dart';
import '../../../social_auth/widgets/welcome_tittle_and_sub_tittle.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key});
 final TextEditingController emailController =TextEditingController();

 final TextEditingController passwordController =TextEditingController();

  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit,LoginState>(
      listener: (context,state){
        if(state is LoadingLogin){
          showDialog(context: context, builder: (context)=>loadingDialog());
        }
        else if(state is LoginFail){
          Navigator.pop(context);
          showDialog(context: context,builder: (context)=>errorDialog(errorMessage:state.errorMessage));
        }
        else if(state is LoginSuccess){
          PushAndRemoveNavigation().navigation(context: context, screen: LayoutScreen());
        }
      },
      builder: (context,state){
        var cubit = LoginCubit.get(context);
        return Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WelcomeTittleAndSubTittle(
                  tittle: AppStrings.welcomeBack,
                  subTittle:AppStrings.welcomeSubTittle
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
                  controller: passwordController,
                  preFixIcon: Icons.lock,
                  sufFixIcon:cubit.hideText?Icons.visibility:Icons.visibility_off,
                  hideText:cubit.hideText,
                  onTapSufFixIcon: (){
                    cubit.changeIcon();
                  },
                  hintText: AppStrings.password,
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
                      cubit.login(email: emailController.text, password: passwordController.text);
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
      },
    );
  }
}
