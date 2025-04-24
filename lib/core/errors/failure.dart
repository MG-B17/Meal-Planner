abstract class Failure {}

class ServerFailure extends Failure{}

class NetworkFailure extends Failure{}

class WrongPasswordFailure extends Failure{}

class EmailNotFoundFailure extends Failure{}

class EmailUsedBeforeFailure extends Failure{}

class UnexpectedFailure extends Failure{}