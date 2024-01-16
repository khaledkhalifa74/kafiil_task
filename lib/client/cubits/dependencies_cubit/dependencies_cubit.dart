import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafiil_task/client/cubits/dependencies_cubit/dependencies_state.dart';
import 'package:kafiil_task/client/models/dependencies_model.dart';
import 'package:kafiil_task/client/services/remote/dio_helper.dart';

class DependenciesCubit extends Cubit<DependenciesStates>{

  DependenciesCubit() : super(DependenciesInitialState());

  static DependenciesCubit get(context) => BlocProvider.of(context);

  DependenciesModel dependenciesModel = DependenciesModel();

  Future<DependenciesModel?> getDependencies() async
  {
    emit(DependenciesLoadingState());
    try {
      Response response = await DioHelper.getData(
        url: '/api/test/dependencies',
       // token: token,
      );
      dependenciesModel = DependenciesModel.fromJson(response.data);
      // print(dependenciesModel.data?.tags?[0].label);
      // print(dependenciesModel.data?.socialMedia?[0].label);
      // print(dependenciesModel.data?.types?[0].label);
      emit(DependenciesSuccessState(dependenciesModel));
      return dependenciesModel;
    } on DioException catch (e) {
      emit(DependenciesFailureState(errorMessage: e.toString()));
    } catch (e) {
      log(e.toString());
      throw Exception('oops there was an error');
    }
    return null;
  }
}