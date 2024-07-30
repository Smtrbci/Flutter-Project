import 'package:firebase_database/firebase_database.dart';
import 'package:todo_mlpcare_app/services/external/iupdate_title_service.dart';

class UpdateTitleService implements IUpDateTitleService{
  final DatabaseReference _todoRef;

  UpdateTitleService(this._todoRef);

  @override
  Future<void> updateTodoTitle(String id, String newTitle) {
    return _todoRef.child(id).update({'title': newTitle});
  }
}