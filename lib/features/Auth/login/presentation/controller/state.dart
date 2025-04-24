abstract class LoginState {}

class LoginInitialState extends LoginState{}

class LoadingLogin extends LoginState{}

class LoginSuccess extends LoginState{}

class LoginFail extends LoginState{
  final String errorMessage;

  LoginFail({required this.errorMessage});
}

class ChangePasswordIcon extends LoginState{}

class LoadingLogOut extends LoginState{}

class LogOutSuccess extends LoginState{}
