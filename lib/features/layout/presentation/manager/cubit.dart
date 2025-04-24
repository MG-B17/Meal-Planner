import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_planner/features/fav/presentation/screen/fav_screen.dart';
import 'package:meal_planner/features/layout/presentation/manager/states.dart';
import 'package:meal_planner/features/profile/presentation/screen/profile_screen.dart';
import '../../../home/presentation/screen/home_screen.dart';

class LayoutCubit extends Cubit<LayoutStates>{

  LayoutCubit():super(LayoutInitialState());

  static LayoutCubit get(context)=>BlocProvider.of(context);

  var scaffoldKey = GlobalKey<ScaffoldState>();

  int currentIndex=0;

  List<Widget> screens=[
     HomeScreen(),
     FavScreen(),
     ProfileScreen(),
  ];

  void changeScreen({required int index}){
    currentIndex=index;
    emit(ChangeScreenState());
  }
}