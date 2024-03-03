abstract class AuthState {}

class AuthInitialState extends AuthState {}

// Login States

class LoginLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {}

class LoginFaliureState extends AuthState {
  final String erorrMessage;
  LoginFaliureState({required this.erorrMessage});
}

// Sign Up States

class SignUpLoadingState extends AuthState {}

class SignUpSuccessState extends AuthState {}

class SignUpFaliureState extends AuthState {
  final String erorrMessage;
  SignUpFaliureState({required this.erorrMessage});
}

// Forget Password States

class ForgetPasswordLoadingState extends AuthState {}

class ForgetPasswordSuccessState extends AuthState {}

class ForgetPasswordFailureState extends AuthState {
  final String erorrMessage;
  ForgetPasswordFailureState({required this.erorrMessage});
}

// Verification States

class VerificationLoadingState extends AuthState {}

class VerificationSuccessState extends AuthState {}

class VerificationFailureState extends AuthState {
  final String erorrMessage;
  VerificationFailureState({required this.erorrMessage});
}

// New Password

class NewPasswordLoadingState extends AuthState {}

class NewPasswordSuccessState extends AuthState {}

class NewPasswordFailureState extends AuthState {
  final String erorrMessage;
  NewPasswordFailureState({required this.erorrMessage});
}


