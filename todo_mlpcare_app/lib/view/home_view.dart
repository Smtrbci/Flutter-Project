import 'package:flutter/material.dart';
import 'package:todo_mlpcare_app/data/realtimedatabesservice.dart';
import 'package:todo_mlpcare_app/data/tododata.dart';
import 'package:todo_mlpcare_app/utilities/dialog_view.dart';

import '../utilities/todo_view.dart';

class homeview extends StatefulWidget {
  const homeview({super.key});

  @override
  State<homeview> createState() => _homeviewState();
}

class _homeviewState extends State<homeview> {
  final RealtimeDatabaseService _databaseService = RealtimeDatabaseService();
  final TextEditingController _controller = TextEditingController();

  void _addTodo() {
    if (_controller.text.isNotEmpty) {
      final todo = Todo(
        id: DateTime.now().toString(),
        title: _controller.text,
        isDone: false,
      );
      _databaseService.addTodo(todo);
      _controller.clear();
      Navigator.of(context).pop();
    }
  }

  void _toggleTodoStatus(Todo todo) {
    todo.isDone = !todo.isDone;
    _databaseService.updateTodo(todo);
  }

  void _deleteTodo(String id) {
    _databaseService.deleteTodo(id);
  }

  void _showAddTodoDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return DialogView(
          controller: _controller,
          onKayit: _addTodo,
          onDevam: () {
            _controller.clear();
            Navigator.of(context).pop();
          },
        );
      },
    );
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
        onPressed: _showAddTodoDialog,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: StreamBuilder<List<Todo>>(
        stream: _databaseService.getTodos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('Veri Yok'),
            );
          }
          final todos = snapshot.data!;
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];
              return ToDoView(
                key: ValueKey(todo.id),
                taskadi: todo.title,
                taskTamamlandi: todo.isDone,
                ondegistirildi: (value) {
                  setState(() {
                    _toggleTodoStatus(todo);
                  });
                },
                silmeIslevi: () {
                  _deleteTodo(todo.id);
                },
              );
            },
          );
        },
      ),
    );
  }
}
