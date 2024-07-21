abstract class SignupStates {}

class SignUpInit extends SignupStates {}

class SignUpLoading extends SignupStates {}

class SignUpError extends SignupStates {
  final String error;
  SignUpError(this.error);
}
