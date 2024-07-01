import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo_mlpcare_app/data/tododata.dart';

class RealtimeDatabaseService {
  late FirebaseDatabase database;
  late DatabaseReference _todoRef;

  RealtimeDatabaseService() {
    _init();
  }

  void _init() {
    database = FirebaseDatabase.instanceFor(
        app: Firebase.app(),
        databaseURL:
        'https://flutter-todo-demo-app-default-rtdb.europe-west1.firebasedatabase.app');
    _todoRef = database.ref();
  }

  String generateId(){
    return _todoRef.push().key!;
  }

  Future<void> addTodo(Todo todo) {
    return _todoRef.child(todo.id).set(todo.toMap());
  }

  Future<void> updateTodo(Todo todo) {
    return _todoRef.child(todo.id).update(todo.toMap());
  }

  Future<void> updateTodoTitle(String id, String newTitle) {
    return _todoRef.child(id).update({'title': newTitle});
  }

  Future<void> deleteTodo(String id) {
    return _todoRef.child(id).remove();
  }

  Future<int?> loadSelectIcon(String userId) async {
    final snapshot = await _todoRef.child('users/$userId/selectedIcon').once();
    final iconIndex = snapshot.snapshot.value;
    if (iconIndex != null) {
      return iconIndex as int;
    }
    return null;
  }

  Future<List<Todo>> getTodos() async {
    final todoStream = _todoRef.onValue.map((event) {
      final todos = <Todo>[];

      final data = event.snapshot.value as Map<dynamic, dynamic>?;

      if (data != null) {
        data.forEach((key, value) {
          final todoMap = value as Map<dynamic, dynamic>?;
          if (todoMap != null) {
            todos.add(Todo(
              id: key,
              title: todoMap['title'],
              isDone: todoMap['isDone'],
              icon: todoMap['icon'] != null
                  ? IconData(todoMap['icon'], fontFamily: 'MaterialIcons')
                  : null,
            ));
          }
        });
      }
      return todos;
    });
    return todoStream.first;
  }
}
