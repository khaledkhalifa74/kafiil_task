import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafiil_task/client/cubits/Who_cubit/who_states.dart';
import 'package:kafiil_task/client/models/user_who_model.dart';
import 'package:kafiil_task/client/services/remote/dio_helper.dart';
import 'package:kafiil_task/global_helpers/globals.dart';

class WhoCubit extends Cubit<WhoStates>{
  WhoCubit() : super(WhoInitialState());

  static WhoCubit get(context) => BlocProvider.of(context);

  UserWhoModel userWhoModel = UserWhoModel();

  Future<UserWhoModel?> getUserWhoData() async
  {
    emit(WhoLoadingState());
    try {
      Response response = await DioHelper.getData(
        url: '/api/test/user/who-am-i',
        token: token,
      );
      userWhoModel = UserWhoModel.fromJson(response.data);
      print(userWhoModel.data?.gender);
      print(userWhoModel.data?.birthDate);
      // print(dependenciesModel.data?.tags?[0].label);
      // print(dependenciesModel.data?.socialMedia?[0].label);
      // print(dependenciesModel.data?.types?[0].label);
      emit(WhoSuccessState(userWhoModel));
      return userWhoModel;
    } on DioException catch (e) {
      emit(WhoFailureState(errorMessage: e.toString()));
    } catch (e) {
      log(e.toString());
      throw Exception('oops there was an error');
    }
    return null;
  }

}