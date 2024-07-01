import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';

class Todo {
  String id;
  String title;
  bool isDone;
  IconData? icon;

  Todo({
    required this.id,
    required this.title,
    this.isDone = false,
    this.icon,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'isDone': isDone,
      'icon': icon?.codePoint,
    };
  }

  factory Todo.fromSnapshot(DataSnapshot snapshot) {
    final value = snapshot.value as Map<dynamic, dynamic>?;

    if (value == null) {
      throw Exception("Anlık Görüntü Değeri Boş");
    }

    return Todo(
      id: snapshot.key!,
      title: value['title'],
      isDone: value['isDone'],
      icon: value['icon'] != null
          ? IconData(value['icon'], fontFamily: 'MaterialIcons')
          : null,
    );
  }

  void updateTitle(String newTitle) {
    title = newTitle;
  }

  void updateIcon(IconData? newIcons) {
    icon = newIcons;
  }
}
