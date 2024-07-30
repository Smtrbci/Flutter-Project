import 'package:firebase_database/firebase_database.dart';
import 'package:todo_mlpcare_app/services/external/idelete_service.dart';

class DeleteService implements IDeleteService {
  final DatabaseReference _todoRef;

  DeleteService(this._todoRef);
  @override
  Future<void> deleteTodo(String id) {
    return _todoRef.child(id).remove();
  }
}
