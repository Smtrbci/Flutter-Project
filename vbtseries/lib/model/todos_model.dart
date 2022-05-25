import 'dart:convert';

List<ToDosModel> toDosModelFromJson(String str) =>
    List<ToDosModel>.from(json.decode(str).map((x) => ToDosModel.fromJson(x)));

String toDosModelToJson(List<ToDosModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ToDosModel {
  int? userId;
  int? id;
  String? title;
  bool? completed;

  ToDosModel({this.userId, this.id, this.title, this.completed});

  ToDosModel.fromJson(Map<String, dynamic> json) {
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