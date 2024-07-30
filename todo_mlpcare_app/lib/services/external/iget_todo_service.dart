import 'package:todo_mlpcare_app/data/tododata.dart';

abstract class IGetTodoService {
  Future<List<Todo>> getTodos();
}