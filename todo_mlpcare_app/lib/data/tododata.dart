import 'package:firebase_database/firebase_database.dart';

class Todo {
  String id;
  String title;
  bool isDone;

  Todo({
    required this.id,
    required this.title,
    this.isDone = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'isDone': isDone,
    };
  }

  factory Todo.fromSnapshot(DataSnapshot snapshot) {
    final value = snapshot.value as Map<dynamic, dynamic>?;

    //if (value == null) {
    //  throw Exception("...");
    //}

    return Todo(
      id: snapshot.key!,
      title: value?['title'],
      isDone: value?['isDone'],
    );
  }
}