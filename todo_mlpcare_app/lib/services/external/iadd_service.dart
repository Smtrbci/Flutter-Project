import 'package:todo_mlpcare_app/data/tododata.dart';

abstract class IAddService{
  Future<void> addTodo(Todo todo);
}