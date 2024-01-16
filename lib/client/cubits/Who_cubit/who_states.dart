import 'package:kafiil_task/client/models/user_who_model.dart';

abstract class WhoStates{}

class WhoInitialState extends WhoStates{}

class WhoLoadingState extends WhoStates{}

class WhoSuccessState extends WhoStates{
  final UserWhoModel userWhoModel;

  WhoSuccessState(this.userWhoModel);
}

class WhoFailureState extends WhoStates{
  String errorMessage;
  WhoFailureState({required this.errorMessage});
}

