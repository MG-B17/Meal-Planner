import 'package:meal_planner/features/profile/domain/entity/user_entity.dart';

abstract class ProfileState {}

class InitialProfileState extends ProfileState{}

class LoadingUpdateProfile extends ProfileState{}

class UpdateProfileSuccess extends ProfileState{}

class UpdateProfileFail extends ProfileState{
  final String message;
  UpdateProfileFail({required this.message});
}

class LoadingGetProfileData extends ProfileState{}

class GetProfileDataSuccess extends ProfileState{
  final UserEntity userEntity;
  GetProfileDataSuccess({required this.userEntity});
}

class GetProfileDataFail extends ProfileState{
  final String message;
  GetProfileDataFail({required this.message});
}