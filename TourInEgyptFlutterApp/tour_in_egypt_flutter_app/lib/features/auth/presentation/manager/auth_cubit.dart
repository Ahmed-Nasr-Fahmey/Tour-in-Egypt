// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tour_in_egypt_flutter_app/core/models/user_model.dart';
import 'package:tour_in_egypt_flutter_app/core/utils/api_service.dart';
import 'package:tour_in_egypt_flutter_app/core/utils/manager/user_cubit.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());

  bool isLoading = false;
  dynamic vereficationOTP;
  List<UserModel>? users;
  String? password;
  bool check = false;

  // Login

  Future<void> signIn({required BuildContext context}) async {
    emit(LoginLoadingState());

    try {
      Map<String, dynamic> data = await ApiService.signIn(
        email: BlocProvider.of<UserCubit>(context).userModel.userEmail!,
        password: BlocProvider.of<UserCubit>(context).userModel.userPassword!,
      );
      if (data['message'] == 'Login successful') {
        BlocProvider.of<UserCubit>(context).userModel =
            UserModel.fromJson(data['user']);
        BlocProvider.of<UserCubit>(context).userModel.token = data['token'];
        await BlocProvider.of<UserCubit>(context).getAllUsers();
        await BlocProvider.of<UserCubit>(context).getAllPosts();
        await BlocProvider.of<UserCubit>(context).getCities();
        await BlocProvider.of<UserCubit>(context).getRestaurants();
        await BlocProvider.of<UserCubit>(context).getCafes();
        emit(LoginSuccessState());
      } else if (data['message'] == 'Email not found') {
        emit(LoginFaliureState(erorrMessage: 'Email not found.'));
      } else if (data['message'] == 'Wrong password') {
        emit(LoginFaliureState(
            erorrMessage: 'Wrong password provided for that user.'));
      } else if (data['message'] == 'Internal Server Error') {
        emit(LoginFaliureState(
            erorrMessage: 'Internal Server Error, try later.'));
      }
    } on Exception {
      emit(LoginFaliureState(erorrMessage: 'There was an error, try again.'));
    }
  }

  Future<void> signInWithGoogle() async {
    // emit(LoginLoadingState());
    // try {
    //   await FirebaseServices.signInWithGoogle();
    //   emit(LoginSuccessState());
    // } on Exception {
    //   emit(LoginFaliureState(
    //       erorrMessage: 'Ther was an Erorr, Please try again.'));
    // }
  }

  // Sign Up

  Future<void> signUp(BuildContext context) async {
    emit(SignUpLoadingState());
    try {
      Map<String, dynamic> data = await ApiService.signUp(
        username: BlocProvider.of<UserCubit>(context).userModel.userName!,
        email: BlocProvider.of<UserCubit>(context).userModel.userEmail!,
        password: BlocProvider.of<UserCubit>(context).userModel.userPassword!,
      );
      if (data['message'] == 'Registration successful') {
        emit(SignUpSuccessState());
      } else if (data['message'] == 'Account already exists') {
        emit(SignUpFaliureState(
            erorrMessage: 'The account already exists for that email.'));
      } else if (data['message'] == 'Internal Server Error') {
        emit(SignUpFaliureState(
            erorrMessage: 'Internal Server Error, try later.'));
      }
    } on Exception {
      emit(SignUpFaliureState(erorrMessage: 'There was an error, try again.'));
    }
  }

  // Forget Password
  Future<void> sendConfirmationCode({required String email}) async {
    emit(ForgetPasswordLoadingState());
    try {
      Map<String, dynamic> data = await ApiService.sendConfirmationCode(
        email: email,
      );
      if (data['message'] == 'Confirmation code sent successfully') {
        emit(ForgetPasswordSuccessState());
      } else if (data['message'] == 'User not found') {
        emit(ForgetPasswordFailureState(
            erorrMessage: 'Email not found, try to regist.'));
      } else if (data['message'] == 'Internal Server Error') {
        emit(ForgetPasswordFailureState(
            erorrMessage: 'Internal Server Error, try later.'));
      }
    } on Exception {
      emit(ForgetPasswordFailureState(
          erorrMessage: 'There was an error, try again.'));
    }
  }

  // Verefication

  Future<void> verifyConfirmationCode(
      {required String email, required String confirmationCode}) async {
    emit(VerificationLoadingState());
    try {
      Map<String, dynamic> data = await ApiService.verifyConfirmationCode(
        email: email,
        confirmationCode: confirmationCode,
      );
      if (data['message'] == 'Confirmation code is valid') {
        emit(VerificationSuccessState());
      } else if (data['message'] == 'User not found') {
        emit(VerificationFailureState(
            erorrMessage: 'Email not found, try to regist.'));
      } else if (data['message'] == 'Invalid confirmation code') {
        emit(VerificationFailureState(
            erorrMessage: 'Verification code not correct.'));
      } else if (data['message'] == 'Internal Server Error') {
        emit(VerificationFailureState(
            erorrMessage: 'Internal Server Error, try later.'));
      }
    } on Exception {
      emit(VerificationFailureState(
          erorrMessage: 'There was an error, try again.'));
    }
  }

  // New Password

  Future<void> updatePassword(
      {required String email, required String newPassword}) async {
    emit(NewPasswordLoadingState());
    try {
      Map<String, dynamic> data = await ApiService.updatePassword(
        email: email,
        newPassword: newPassword,
      );
      if (data['message'] == 'Password updated successfully') {
        emit(NewPasswordSuccessState());
      } else if (data['message'] == 'User not found') {
        emit(NewPasswordFailureState(
            erorrMessage: 'Email not found, try to regist.'));
      } else if (data['message'] == 'Internal Server Error') {
        emit(NewPasswordFailureState(
            erorrMessage: 'Internal Server Error, try later.'));
      }
    } on Exception {
      emit(NewPasswordFailureState(
          erorrMessage: 'There was an error, try again.'));
    }
  }
}
