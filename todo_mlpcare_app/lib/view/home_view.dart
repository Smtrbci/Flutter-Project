import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_mlpcare_app/data/database.dart';
import 'package:todo_mlpcare_app/utilities/dialog_view.dart';

import '../utilities/todo_view.dart';

class homeview extends StatefulWidget {
  const homeview({super.key});

  @override
  State<homeview> createState() => _homeviewState();
}

class _homeviewState extends State<homeview> {
  final _myBox = Hive.box('myBox');
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    super.initState();
    if (_myBox.get("TODOLISTESI") == null) {
      db.initiaDataOlusturma();
    } else {
      db.yuklemeData();
    }
  }

  final _kontroller = TextEditingController();

  void checkBoxDegisimi(bool? value, int index) {
    setState(() {
      db.toDoListesi[index][1] = !db.toDoListesi[index][1];
    });
    db.guncelemeDataBase();
  }

  void yeniKayitTask() {
    setState(() {
      db.toDoListesi.add([_kontroller.text, false]);
      _kontroller.clear();
    });
    Navigator.of(context).pop();
    db.guncelemeDataBase();
  }

  void taskOlusturma() {
    showDialog(
      context: context,
      builder: (contex) {
        return DialogView(
          kontroller: _kontroller,
          onDevam: () => Navigator.of(context).pop(),
          onKayit: yeniKayitTask,
        );
      },
    );
  }

  void taskSilme(int index) {
    setState(() {
      db.toDoListesi.removeAt(index);
    });
    db.guncelemeDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(66, 85, 99, 70),
      appBar: AppBar(
        title: const Center(
          child: Text(
            "To Do MLPCare",
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: const Color.fromRGBO(66, 85, 99, 50),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlue,
        onPressed: taskOlusturma,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: ListView.builder(
        itemCount: db.toDoListesi.length,
        itemBuilder: (context, index) {
          return ToDoView(
            taskadi: db.toDoListesi[index][0],
            taskTamamlandi: db.toDoListesi[index][1],
            ondegistirildi: (value) => checkBoxDegisimi(value, index),
            silmeIslevi: () => taskSilme(index),
          );
        },
      ),
    );
  }
}
