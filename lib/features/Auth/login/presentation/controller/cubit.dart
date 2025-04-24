import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_planner/config/navigaation/navigation.dart';
import 'package:meal_planner/core/errors/mapFailureToMessage.dart';
import 'package:meal_planner/core/helper/cacheHelper/cache_helper.dart';
import 'package:meal_planner/core/helper/firebase_helper/firebase_key.dart';
import 'package:meal_planner/core/services/save_fav/fav_sqflite.dart';
import 'package:meal_planner/features/Auth/login/domain/entity/login_entity.dart';
import 'package:meal_planner/features/Auth/login/domain/use_case/login_use_case.dart';
import 'package:meal_planner/features/Auth/login/presentation/controller/state.dart';
import 'package:meal_planner/features/intro/toggle/toggle_screen.dart';

class LoginCubit extends Cubit<LoginState>{
  final LoginUseCase loginUseCase;

  LoginCubit({required this.loginUseCase}):super(LoginInitialState());

  bool hideText=true;

  static LoginCubit get(context)=>BlocProvider.of(context);

  void login({required String email, required String password})async{
    emit(LoadingLogin());
    final loginEntity = LoginEntity(email: email, password: password);
    final result = await loginUseCase.call(loginEntity: loginEntity);
    result.fold(
            (failure)=>emit(LoginFail(errorMessage: mapFailureToMessage(failure: failure))),
            (_)=>emit(LoginSuccess())
    );
  }

  void changeIcon (){
    hideText=!hideText;
    emit(ChangePasswordIcon());
  }

  void logOut(context){
    emit(LoadingLogOut());
    PushAndRemoveNavigation().navigation(context: context, screen: ToggleScreen());
    SqfliteHelper.deleteDB();
    CacheHelper.remove(key: uid);
    emit(LogOutSuccess());
  }
}