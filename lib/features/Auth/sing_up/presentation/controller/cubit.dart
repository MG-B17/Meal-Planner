import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_planner/core/errors/mapFailureToMessage.dart';
import 'package:meal_planner/features/Auth/sing_up/domain/entity/sing_up_entity.dart';
import 'package:meal_planner/features/Auth/sing_up/domain/use_case/create_account_use_case.dart';
import 'package:meal_planner/features/Auth/sing_up/presentation/controller/state.dart';

class CreateAccountCubit extends Cubit<CreateAccountState>{
  final CreateAccountUseCase createAccountUseCase;

  CreateAccountCubit({required this.createAccountUseCase}):super(CreateAccountInitialState());

  static CreateAccountCubit get(context)=>BlocProvider.of(context);

  bool hideText=true;
  void createAccount({required String fullName,required String email , required String phone , required String password})async{
    emit(LoadingCreateAccount());
    final userEntity = SingUpEntity(password: password, email: email, phone: phone, fullName: fullName);
    final result = await createAccountUseCase.call(userEntity: userEntity);

    result.fold(
            (failure)=>emit(CreateAccountFail(errorMessage: mapFailureToMessage(failure: failure))),
            (_)=>emit(CreateAccountSuccess())
    );
  }

  void changeIcon(){
    hideText=!hideText;
    emit(ChangePasswordIcon());
  }
}