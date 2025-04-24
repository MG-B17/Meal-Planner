import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_planner/core/errors/mapFailureToMessage.dart';
import 'package:meal_planner/features/Auth/social_auth/logic/controller/state.dart';
import 'package:meal_planner/features/Auth/social_auth/logic/remote_data/google_sing_in.dart';

class SocialCubit extends Cubit<SocialSingInState>{

  SocialCubit():super(InitialState());

  static SocialCubit get(context)=>BlocProvider.of(context);

  void googleSingIn ()async{

    GoogleSingInData googleSingInData=GoogleSingInData();
    emit(LoadingSingIn());
   final result = await googleSingInData.signInWithGoogle();
   result.fold(
           (failure)=>emit(SingInFail(message: mapFailureToMessage(failure: failure))),
       (_)=>emit(SingInSuccess())
   );
  }
}