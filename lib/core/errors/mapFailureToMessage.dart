import 'errorStrings.dart';
import 'failure.dart';

String mapFailureToMessage({required Failure failure}){
  switch(failure){
    case ServerFailure():
      return ErrorStrings.serverError;
    case NetworkFailure():
      return ErrorStrings.checkYouInternetConnection;
    case WrongPasswordFailure():
      return ErrorStrings.wrongPassword;
    case  EmailNotFoundFailure():
      return ErrorStrings.accountDoesNotFound;
    case EmailUsedBeforeFailure():
      return ErrorStrings.emailUsedBefore;
    case UnexpectedFailure():
      return ErrorStrings.unexpectedError;
    default:
      return "";
  }
}