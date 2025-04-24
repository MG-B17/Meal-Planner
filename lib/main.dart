import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_planner/core/di/di.dart';
import 'package:meal_planner/core/helper/cacheHelper/cache_helper.dart';
import 'package:meal_planner/core/helper/firebase_helper/firebase_key.dart';
import 'package:meal_planner/core/services/recipe_api_image/recipe_image_api.dart';
import 'package:meal_planner/core/utilies/variables/variables.dart';
import 'package:meal_planner/features/intro/onBoarding/onboarding_screen.dart';
import 'package:meal_planner/features/intro/toggle/toggle_screen.dart';
import 'config/blocObserver.dart';
import 'core/helper/dioHelper/dio_helper.dart';
import 'core/services/save_fav/fav_sqflite.dart';
import 'features/layout/presentation/pages/layout.dart';
import 'firebase_options.dart';
import 'meal_planner.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await ScreenUtil.ensureScreenSize();

  Bloc.observer = MyBlocObserver();

  await init();

  SqfliteHelper.createDatabase();

  DioHelper.initDio();

  RecipeApi.initDio();

  setScreen();

  runApp(MealPlanner());
}


void setScreen ()async{
  final String token = await CacheHelper.getData(key: uid)??"";
  final bool onboarding = await CacheHelper.getData(key: onBoardingKey)??false;

  if(token.isEmpty && onboarding == false){
    Variables.screen= OnboardingScreen();
  }
  else if(token.isNotEmpty){
    Variables.screen= LayoutScreen();
  }else if(onboarding && token.isEmpty){
    Variables.screen= ToggleScreen();
  }else{
    Variables.screen= OnboardingScreen();
  }
}
