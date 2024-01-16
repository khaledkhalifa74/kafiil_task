import 'package:kafiil_task/client/models/login_model.dart';

abstract class AuthStates{}

class AuthInitialState extends AuthStates{}

class RegisterLoadingState extends AuthStates{}

class RegisterSuccessState extends AuthStates{}

class RegisterFailureState extends AuthStates{
  String errorMessage;
  RegisterFailureState({required this.errorMessage});
}

class LoginSuccessState extends AuthStates{
  final LoginModel loginModel;

  LoginSuccessState(this.loginModel);
}

class LoginLoadingState extends AuthStates{}

class LoginFailureState extends AuthStates{
  String errorMessage;
  LoginFailureState({required this.errorMessage});
}

class ChangePasswordVisibility extends AuthStates{}
class ChangeConfirmPasswordVisibility extends AuthStates{}
