abstract class CreateAccountState {}

class CreateAccountInitialState extends CreateAccountState{}

class LoadingCreateAccount extends CreateAccountState{}

class CreateAccountSuccess extends CreateAccountState{}

class CreateAccountFail extends CreateAccountState{
  final String errorMessage ;

  CreateAccountFail({required this.errorMessage});
}

class ChangePasswordIcon extends CreateAccountState{}
