class UserWhoModel {
  int? status;
  bool? success;
  Data? data;

  UserWhoModel({this.status, this.success, this.data});

  UserWhoModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? firstName;
  String? lastName;
  String? about;
  List<Tags>? tags;
  List<String>? favoriteSocialMedia;
  int? salary;
  String? email;
  String? birthDate;
  int? gender;
  Type? type;
  String? avatar;

  Data(
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

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    about = json['about'];
    if (json['tags'] != null) {
      tags = <Tags>[];
      json['tags'].forEach((v) {
        tags!.add(Tags.fromJson(v));
      });
    }
    favoriteSocialMedia = json['favorite_social_media'].cast<String>();
    salary = json['salary'];
    email = json['email'];
    birthDate = json['birth_date'];
    gender = json['gender'];
    type = json['type'] != null ? Type.fromJson(json['type']) : null;
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

class Tags {
  int? id;
  String? name;

  Tags({this.id, this.name});

  Tags.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class Type {
  int? code;
  String? name;
  String? niceName;

  Type({this.code, this.name, this.niceName});

  Type.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    niceName = json['nice_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['name'] = name;
    data['nice_name'] = niceName;
    return data;
  }
}
