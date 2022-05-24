import 'dart:convert';

IdModel idModelFromJson(String str) => IdModel.fromJson(json.decode(str));

String idModelToJson(IdModel data) => json.encode(data.toJson());

class IdModel {
  int? userId;
  int? id;
  String? title;
  bool? completed;

  IdModel({this.userId, this.id, this.title, this.completed});

  IdModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    completed = json['completed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    data['completed'] = completed;
    return data;
  }
}
