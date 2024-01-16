class DependenciesModel {
  int? status;
  bool? success;
  Data? data;

  DependenciesModel({this.status, this.success, this.data});



  DependenciesModel.fromJson(Map<String, dynamic> json) {
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
  List<Types>? types;
  List<Tags>? tags;
  List<SocialMedia>? socialMedia;

  Data({this.types, this.tags, this.socialMedia});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['types'] != null) {
      types = <Types>[];
      json['types'].forEach((v) {
        types!.add(Types.fromJson(v));
      });
    }
    if (json['tags'] != null) {
      tags = <Tags>[];
      json['tags'].forEach((v) {
        tags!.add(Tags.fromJson(v));
      });
    }
    if (json['social_media'] != null) {
      socialMedia = <SocialMedia>[];
      json['social_media'].forEach((v) {
        socialMedia!.add(SocialMedia.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (types != null) {
      data['types'] = types!.map((v) => v.toJson()).toList();
    }
    if (tags != null) {
      data['tags'] = tags!.map((v) => v.toJson()).toList();
    }
    if (socialMedia != null) {
      data['social_media'] = socialMedia!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tags {
  int? value;
  String? label;

  Tags({this.value, this.label});

  Tags.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['value'] = value;
    data['label'] = label;
    return data;
  }
}

class Types {
  int? value;
  String? label;

  Types({this.value, this.label});

  Types.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['value'] = value;
    data['label'] = label;
    return data;
  }
}

class SocialMedia {
  String? value;
  String? label;

  SocialMedia({this.value, this.label});

  SocialMedia.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['value'] = value;
    data['label'] = label;
    return data;
  }
}


