import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafiil_task/client/cubits/auth_cubit/auth_state.dart';
import 'package:kafiil_task/client/models/login_model.dart';
import 'package:kafiil_task/client/services/remote/dio_helper.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());

  static AuthCubit get(context) => BlocProvider.of(context);
  LoginModel loginModel = LoginModel();

  Future<void> loginUser(
      {required String email, required String password}) async {
    emit(LoginLoadingState());
    try {
      Response response = await DioHelper.postData(
        contentType: 'application/json',
        url: 'https://test.kafiil.com/api/test/user/login',
        data: {
          'email': email,
          'password': password,
        },
      );
      if(response.statusCode == 200){
        emit(LoginSuccessState(loginModel));
      }
      // ).then((value) {
      //   if (kDebugMode) {
      //     print(value.data);
      //     loginModel = LoginModel.fromJson(value.data);
      //     print(loginModel.data?.firstName);
      //   }
      //   emit(LoginSuccessState(loginModel));
      //   response.statusCode
      // });
    } catch (error) {
      emit(LoginFailureState(errorMessage: error.toString()));
    }
  }

  Future<void> registerUser(
      {required String email, required String password}) async {
    emit(RegisterLoadingState());
    try {
      emit(RegisterSuccessState());
    } on Exception catch (error) {
      emit(RegisterFailureState(errorMessage: error.toString()));
    }
  }

  IconData passwordVisible = Icons.visibility_outlined;
  bool isPasswordShown = false;
  bool isConfirmPasswordShown = false;

  void changePasswordVisibility() {
    isPasswordShown = !isPasswordShown;
    passwordVisible = isPasswordShown
        ? Icons.visibility_off_outlined
        : Icons.visibility_outlined;
    emit(ChangePasswordVisibility());
  }
  void changeConfirmPasswordVisibility() {
    isConfirmPasswordShown = !isConfirmPasswordShown;
    passwordVisible = isConfirmPasswordShown
        ? Icons.visibility_off_outlined
        : Icons.visibility_outlined;
    emit(ChangePasswordVisibility());
  }
}
