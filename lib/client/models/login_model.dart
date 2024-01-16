import 'package:kafiil_task/client/models/user_data_model.dart';

class LoginModel {
  int? status;
  bool? success;
  UserData? userData;
  String? accessToken;

  LoginModel({this.status, this.success, this.userData, this.accessToken});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    success = json['success'];
    userData = json['data'] != null ? UserData.fromJson(json['data']) : null;
    accessToken = json['access_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['success'] = success;
    if (userData != null) {
      data['data'] = userData!.toJson();
    }
    data['access_token'] = accessToken;
    return data;
  }
}
