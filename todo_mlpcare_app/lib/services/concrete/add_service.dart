import 'package:firebase_database/firebase_database.dart';
import 'package:todo_mlpcare_app/data/tododata.dart';
import 'package:todo_mlpcare_app/services/external/iadd_service.dart';

class AddService implements IAddService{
  final DatabaseReference _todoRef;

  AddService(this._todoRef);

  @override
  Future<void> addTodo(Todo todo) {
    return _todoRef.child(todo.id).set(todo.toMap());
  }
}