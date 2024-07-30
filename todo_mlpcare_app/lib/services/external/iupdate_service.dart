import 'package:todo_mlpcare_app/data/tododata.dart';

abstract class IUpDateService{
  Future<void> update(Todo todo);
}