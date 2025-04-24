import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_planner/core/errors/mapFailureToMessage.dart';
import 'package:meal_planner/features/profile/domain/entity/user_entity.dart';
import 'package:meal_planner/features/profile/domain/usecase/get_user_data_usecase.dart';
import 'package:meal_planner/features/profile/domain/usecase/update_user_data_use_case.dart';
import 'package:meal_planner/features/profile/presentation/controller/state.dart';

import '../../../../core/utilies/strings/app_strings.dart';
import '../../../../core/utilies/widgets/snak_bar.dart';

class ProfileCubit extends Cubit<ProfileState>{
  final GetUserDataUseCase getUserDataUseCase;

  final UpdateUserDataUseCase updateUserDataUseCase;

  ProfileCubit({required this.updateUserDataUseCase,required this.getUserDataUseCase}):super(InitialProfileState());

  static ProfileCubit get(context)=>BlocProvider.of(context);


  void updateProfile({required String name,required email, required phone,context})async{
    emit(LoadingUpdateProfile());
    final UserEntity userData= UserEntity(phone: phone, email: email, name: name);
    final result=await updateUserDataUseCase.call(userEntity: userData);
    result.fold((failure){
      emit(UpdateProfileFail(message: mapFailureToMessage(failure: failure)));
    ScaffoldMessenger.of(context).showMaterialBanner(mySnackBar(context: context, text: AppStrings.profileUpdateFail, contentType: ContentType.failure));
    },
            (_){
      emit(UpdateProfileSuccess());
      getUserData();
      ScaffoldMessenger.of(context).showMaterialBanner(mySnackBar(context: context, text: AppStrings.profileUpdateSuccess, contentType: ContentType.success));
    });
  }

  void getUserData()async{
    emit(LoadingGetProfileData());
    final result = await getUserDataUseCase.call();
    result.fold((failure)=>emit(GetProfileDataFail(message: mapFailureToMessage(failure: failure))),(userData)=>emit(GetProfileDataSuccess(userEntity: userData)));
  }
}