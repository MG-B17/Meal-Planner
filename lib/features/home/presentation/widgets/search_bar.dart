import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/navigaation/navigation.dart';
import '../../../../core/utilies/strings/app_strings.dart';
import '../../../../core/utilies/widgets/text_form_field.dart';
import '../../../search/presentation/screen/search_screen.dart';

SliverPadding searchBar(context){
  return SliverPadding(
    padding: EdgeInsets.symmetric(horizontal: 16.w),
    sliver: SliverToBoxAdapter(
      child: MyTextFormField(
          controller: TextEditingController(),
          preFixIcon:Icons.search,
          hintText: AppStrings.search,
          validation: (value){
            return null;
          },
          onTap: (){
            PushNavigation().navigation(context: context, screen:SearchScreen());
          },
          keyBoardType:TextInputType.none
      ),
    ),
  );
}