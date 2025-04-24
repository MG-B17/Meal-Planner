import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_planner/config/navigaation/navigation.dart';
import 'package:meal_planner/features/gemini_chat/presentation/gemini_chat_screen.dart';
import '../../../../core/utilies/colors/color_manager.dart';
import '../manager/cubit.dart';
import '../manager/states.dart';
import '../widget/bottomNavBarWidgets/bottomNavBar.dart';
import '../widget/drawerWidgeta/drawer.dart';


class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>LayoutCubit(),
      child: BlocConsumer<LayoutCubit,LayoutStates>(
          listener: (context,state){},
          builder:(context,state){
            var cubit = LayoutCubit.get(context);
            return Scaffold(
              backgroundColor: ColorManager.primaryColor,
              appBar: AppBar(
                backgroundColor: ColorManager.primaryColor,
                leading: Builder(
                    builder: (context) {
                      return IconButton(
                        icon:Icon(
                          Icons.menu,
                          color: ColorManager.secondaryColor,
                          size: 26.sp,
                        ),
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                      );
                    }
                ),
                actions: [
                  IconButton(
                    icon:Icon(
                      Icons.notifications,
                      color: ColorManager.secondaryColor,
                      size: 26.sp,
                    ),
                    onPressed: ()async{
                    // await  GeminiApi.geminiResponse(recipeName:"pasta", sendTime:"12:5");
                    },
                  )],),
              body:cubit.screens[cubit.currentIndex],
              drawer: myDrawer(index: cubit.currentIndex,context: context),
              floatingActionButton: FloatingActionButton(
                shape: CircleBorder(),
                elevation: .5,
                backgroundColor: ColorManager.secondaryColor,
                onPressed: (){PushNavigation().navigation(context: context, screen: GeminiChat());},
                child: Center(
                  child: Icon(
                  Icons.chat_bubble,
                  color: ColorManager.primaryColor,
                  size: 26.sp,
                                ),
                ),),
              bottomNavigationBar: myBottomNavigationBar(index: cubit.currentIndex,context: context),
            );
          }
      ),
    );
  }
}
