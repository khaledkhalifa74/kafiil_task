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
