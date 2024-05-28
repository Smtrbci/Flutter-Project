import 'package:firebase_database/firebase_database.dart';
import 'package:todo_mlpcare_app/data/tododata.dart';


class RealtimeDatabaseService {
  final DatabaseReference _todoRef = FirebaseDatabase(databaseURL: "https://flutter-todo-demo-app-default-rtdb.europe-west1.firebasedatabase.app").reference();

  Future<void> addTodo(Todo todo) {
    return _todoRef.push().set(todo.toMap());
  }

  Future<void> updateTodo(Todo todo) {
    return _todoRef.child(todo.id).update(todo.toMap());
  }

  Future<void> deleteTodo(String id) {
    return _todoRef.child(id).remove();
  }

  Stream<List<Todo>> getTodos() {
    return _todoRef.onValue.map((event) {
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
            ));
          }
        });
      }
      return todos;
    });
  }
}
