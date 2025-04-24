abstract class SocialSingInState {}

class InitialState extends SocialSingInState{}

class LoadingSingIn extends SocialSingInState{}

class SingInSuccess extends SocialSingInState{}

class SingInFail extends SocialSingInState{
  final String message;

  SingInFail({required this.message});
}
