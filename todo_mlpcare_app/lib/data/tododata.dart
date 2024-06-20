import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';

class Todo {
  String id;
  String title;
  //String userId;
  bool isDone;
  IconData? icon;

  Todo({
    required this.id,
    required this.title,
    //required this.userId,
    this.isDone = false,
    this.icon, required,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'isDone': isDone,
      //'your_user_id': userId,
      'icon': icon?.codePoint,
    };
  }

  factory Todo.fromSnapshot(DataSnapshot snapshot) {
    final value = snapshot.value as Map<dynamic, dynamic>?;

    if (value == null) {
      throw Exception("...");
    }

    return Todo(
      id: snapshot.key!,
      title: value['title'],
      isDone: value['isDone'],
      //userId: value['your_user_id'],
      icon: value['icon'] != null ? IconData(value['icon'], fontFamily: 'MaterialIcons') : null,
    );
  }

  void updateTitle(String newTitle) {
    title = newTitle;
  }

  void updateIcon(IconData? newIcons) {
    icon = newIcons;
  }
}
