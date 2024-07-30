import 'package:firebase_database/firebase_database.dart';
import 'package:todo_mlpcare_app/services/external/iload_select_icon_service.dart';

class LoadSelectIconService implements ILoadSelectIconService {
  final DatabaseReference _todoRef;

  LoadSelectIconService(this._todoRef);

  @override
  Future<int?> loadSelectIcon(String userId) async {
    final snapshot = await _todoRef.child('users/$userId/selectedIcon').once();
    final iconIndex = snapshot.snapshot.value;
    if (iconIndex != null) {
      return iconIndex as int;
    }
    return null;
  }
}
