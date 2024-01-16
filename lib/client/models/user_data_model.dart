import 'package:kafiil_task/client/models/user_tags_model.dart';
import 'package:kafiil_task/client/models/user_type_model.dart';

class UserData {
  int? id;
  String? firstName;
  String? lastName;
  String? about;
  List<UserTags>? tags;
  List<String>? favoriteSocialMedia;
  int? salary;
  String? email;
  String? birthDate;
  int? gender;
  UserType? type;
  String? avatar;

  UserData(
      {this.id,
        this.firstName,
        this.lastName,
        this.about,
        this.tags,
        this.favoriteSocialMedia,
        this.salary,
        this.email,
        this.birthDate,
        this.gender,
        this.type,
        this.avatar});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    about = json['about'];
    if (json['tags'] != null) {
      tags = <UserTags>[];
      json['tags'].forEach((v) {
        tags!.add(UserTags.fromJson(v));
      });
    }
    favoriteSocialMedia = json['favorite_social_media'].cast<String>();
    salary = json['salary'];
    email = json['email'];
    birthDate = json['birth_date'];
    gender = json['gender'];
    type = json['type'] != null ? UserType.fromJson(json['type']) : null;
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['about'] = about;
    if (tags != null) {
      data['tags'] = tags!.map((v) => v.toJson()).toList();
    }
    data['favorite_social_media'] = favoriteSocialMedia;
    data['salary'] = salary;
    data['email'] = email;
    data['birth_date'] = birthDate;
    data['gender'] = gender;
    if (type != null) {
      data['type'] = type!.toJson();
    }
    data['avatar'] = avatar;
    return data;
  }
}