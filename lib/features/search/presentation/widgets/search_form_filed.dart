import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utilies/strings/app_strings.dart';
import '../../../../core/utilies/widgets/text_form_field.dart';
import '../controller/cubit.dart';

class SearchFormFiled extends StatelessWidget {
SearchFormFiled({super.key,required this.search});

  TextEditingController search;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.symmetric(horizontal: 16.w),
      child: MyTextFormField(
        controller:search,
        preFixIcon:Icons.search,
        hintText:AppStrings.search,
        validation:(value){
          return null;
        },
        keyBoardType:TextInputType.text,
        onFiledSubmit: (value){
          SearchCubit.get(context).search(mealName: search.text);
        },
      ),
    );
  }
}
