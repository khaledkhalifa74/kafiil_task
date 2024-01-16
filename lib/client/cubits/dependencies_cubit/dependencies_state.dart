import 'package:kafiil_task/client/models/dependencies_model.dart';

abstract class DependenciesStates{}

class DependenciesInitialState extends DependenciesStates{}

class DependenciesLoadingState extends DependenciesStates{}

class DependenciesSuccessState extends DependenciesStates{
  final DependenciesModel dependenciesModel;

  DependenciesSuccessState(this.dependenciesModel);
}

class DependenciesFailureState extends DependenciesStates{
  String errorMessage;
  DependenciesFailureState({required this.errorMessage});
}

