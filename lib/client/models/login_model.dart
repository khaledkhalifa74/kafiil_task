import 'package:kafiil_task/client/models/user_data_model.dart';

class LoginModel {
  int? status;
  bool? success;
  UserData? data;
  String? accessToken;

  LoginModel({this.status, this.success, this.data, this.accessToken});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    success = json['success'];
    data = json['data'] != null ? UserData.fromJson(json['data']) : null;
    accessToken = json['access_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['access_token'] = accessToken;
    return data;
  }
}
