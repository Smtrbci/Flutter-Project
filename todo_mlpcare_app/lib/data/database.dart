import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDoListesi = [];

  final _myBox = Hive.box('myBox');
  void initiaDataOlusturma() {
    toDoListesi = [
      ["Merhaba", false],
      ["Selam", false],
    ];
  }

  void yuklemeData() {
    toDoListesi = _myBox.get("TODOLISTESI");
  }

  void guncelemeDataBase() {
    _myBox.put("TODOLISTESI", toDoListesi);
  }
}