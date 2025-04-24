import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:meal_planner/config/theme/appTheme.dart';
import 'package:meal_planner/core/utilies/colors/color_manager.dart';
import 'package:meal_planner/features/Auth/login/presentation/controller/cubit.dart';
import 'package:meal_planner/features/Auth/sing_up/presentation/controller/cubit.dart';
import 'package:meal_planner/features/fav/presentation/controller/cubit.dart';
import 'package:meal_planner/features/gemini_chat/presentation/controller/cubit.dart';
import 'package:meal_planner/features/home/presentation/controller/cubit.dart';
import 'package:meal_planner/features/intro/onBoarding/onboarding_screen.dart';
import 'package:meal_planner/features/profile/presentation/controller/cubit.dart';
import 'package:meal_planner/features/search/presentation/controller/cubit.dart';
import 'package:meal_planner/features/spalsh_screen/splash_screen.dart';
import 'core/utilies/strings/app_strings.dart';
import 'package:meal_planner/core/di/di.dart'as di;

import 'core/utilies/variables/variables.dart';

class MealPlanner extends StatelessWidget {
  const MealPlanner({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
     builder: (_ , child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context)=>di.sl<LoginCubit>()),
            BlocProvider(create: (context)=>di.sl<CreateAccountCubit>()),
            BlocProvider(create: (context)=>di.sl<HomePageCubit>()),
            BlocProvider(create: (context)=>di.sl<GeminiChatCubit>()),
            BlocProvider(create: (context)=>di.sl<FavCubit>()..getFavMeals()),
            BlocProvider(create: (context)=>di.sl<ProfileCubit>()..getUserData()),
            BlocProvider(create: (context)=>di.sl<SearchCubit>()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: AppStrings.appName,
            theme: appTheme(),
            home:SplashScreen(nextScreen:Variables.screen??OnboardingScreen()) ,
          ),
        );
      },
    );
  }
}
