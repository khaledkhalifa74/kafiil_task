import 'dart:io';

import 'package:dio/dio.dart';
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
        url: '/api/test/user/login',
        data: {
          'email': email,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        LoginModel loginModel = LoginModel.fromJson(response.data);
        emit(LoginSuccessState(loginModel));
        //CasheHelper.saveData(key: 'login', value: true); //save user
      }
    } catch (error) {
      emit(LoginFailureState(errorMessage: error.toString()));
    }
  }

  Future<void> registerUser({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmPassword,
    required int userType,
    required File? avatar,
    required String about,
    required int salary,
    required String birthDate,
    required int gender,
    required List<String> skills,
    required List<String?> socialMedia,
  }) async {
    emit(RegisterLoadingState());
    try {
      Response response = await DioHelper.postData(
          contentType: 'multipart/form-data',
          url: '/api/test/user/register',
          data: {
            'first_name' : firstName,
            'last_name' : lastName,
            'email' : email,
            'password' : password,
            'password_confirmation' : confirmPassword,
            'type' : userType,
            'avatar' : avatar,
            'about' : about,
            'salary' : salary,
            'birth_date' : birthDate,
            'gender' : gender,
            'tags' : skills,
            'favorite_social_media' : socialMedia,
          },
      );
      if (response.statusCode == 200) {
        emit(RegisterSuccessState());
      }
    } catch (error) {
      emit(RegisterFailureState(errorMessage: error.toString()));
    }
  }


  IconData passwordVisible = Icons.visibility_outlined;
  IconData confirmPasswordVisible = Icons.visibility_outlined;
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
    confirmPasswordVisible = isConfirmPasswordShown
        ? Icons.visibility_off_outlined
        : Icons.visibility_outlined;
    emit(ChangeConfirmPasswordVisibility());
  }
}
