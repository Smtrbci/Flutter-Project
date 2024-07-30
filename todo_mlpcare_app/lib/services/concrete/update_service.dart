import 'package:firebase_database/firebase_database.dart';
import 'package:todo_mlpcare_app/data/tododata.dart';
import 'package:todo_mlpcare_app/services/external/iupdate_service.dart';

class UpDateService implements IUpDateService{
  final DatabaseReference _todoRef;

  UpDateService(this._todoRef);

  @override
  Future<void> update(Todo todo){
    return _todoRef.child(todo.id).set(todo.toMap());
  }
}