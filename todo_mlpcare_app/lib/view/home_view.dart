import 'dart:async';
import 'package:flutter/material.dart';
import 'package:todo_mlpcare_app/data/realtimedatabesservice.dart';
import 'package:todo_mlpcare_app/data/tododata.dart';
import 'package:todo_mlpcare_app/utilities/appbar_view.dart';
import 'package:todo_mlpcare_app/utilities/dialog_view.dart';
import 'package:todo_mlpcare_app/view/update_text_view.dart';

import '../utilities/todo_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Future<List<Todo>>? futureTodoList;
  List<Todo>? _todos;
  final RealtimeDatabaseService _databaseService = RealtimeDatabaseService();
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadTodos();
  }

  void _loadTodos() {
    setState(() {
      futureTodoList = _databaseService.getTodos();
    });
  }

  void _addTodo() {
    if (_controller.text.isNotEmpty) {
      final todo = Todo(
        id: DateTime.now().toString(),
        title: _controller.text,
        isDone: false,
        //userId: "you_user_icon"
      );
      _databaseService.addTodo(todo).then((_) {
        _loadTodos();
        _controller.clear();
        Navigator.of(context).pop();
      });
    }
  }

  void _toggleTodoStatus(Todo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
    _databaseService.updateTodo(todo);
  }

  void _deleteTodo(String id) {
    _databaseService.deleteTodo(id).then((_) {
      _loadTodos();
    });
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

  void _showUpdateTodoView(Todo todo) async {
    final updatedTodo = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => UpdateTextView(
          todo: todo,
        ),
      ),
    );
    if (updatedTodo != null) {
      setState(() {
        final index = _todos!.indexWhere((t) => t.id == updatedTodo.id);
        if (index != -1) {
          _todos![index] = updatedTodo;
        }
      });
    }
  }

  Future<void> _refshTodos() async {
    _loadTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(66, 85, 99, 70),
        appBar: const AppBarView(
          title: '',
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
        body: RefreshIndicator(
          onRefresh: _refshTodos,
          child: FutureBuilder<List<Todo>>(
            future: futureTodoList,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text('Hata: ${snapshot.error}'),
                );
              }
              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(
                  child: Text(
                    "Notunuz Yok \n '+' Butona Basarak Not Ekleyebilirsiniz",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                );
              }
              _todos = snapshot.data!;
              return ListView.builder(
                itemCount: _todos!.length,
                itemBuilder: (context, index) {
                  final todo = _todos![index];
                  return ToDoView(
                    key: ValueKey(todo.id),
                    todo: todo,
                    ondegistirildi: (value) {
                      setState(() {
                        _toggleTodoStatus(todo);
                      });
                    },
                    silmeIslevi: () {
                      _deleteTodo(todo.id);
                    },
                    onTap: () {
                      _showUpdateTodoView(todo);
                    },
                  );
                },
              );
            },
          ),
        ));
  }
}
