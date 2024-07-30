import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_mlpcare_app/data/tododata.dart';
import 'package:todo_mlpcare_app/services/external/iget_todo_service.dart';

class GetTodoService implements IGetTodoService{
  final DatabaseReference _todoRef;

  GetTodoService(this._todoRef);

  @override
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