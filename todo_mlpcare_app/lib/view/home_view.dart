import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:todo_mlpcare_app/data/realtimedatabesservice.dart';
import 'package:todo_mlpcare_app/data/tododata.dart';
import 'package:todo_mlpcare_app/utilities/appbar_view.dart';
import 'package:todo_mlpcare_app/view/update_text_view.dart';
import '../utilities/todo_view.dart';

@RoutePage()
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Todo> _todos = [];
  final RealtimeDatabaseService _databaseService = RealtimeDatabaseService();
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadTodos();
  }

  void _loadTodos() {
    _databaseService.getTodos().then((todos) {
      setState(() {
        _todos = todos;
      });
    });
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

  void _showUpdateTodoView(Todo todo) async {
    final updatedTodo = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => UpdateTextView(todo: todo),
      ),
    );
    if (updatedTodo != null) {
      setState(() {
        final index = _todos.indexWhere((t) => t.id == updatedTodo.id);
        if (index != -1) {
          _todos[index] = updatedTodo;
        }
      });
      _loadTodos();
    }
  }

  void _openUpdateTextViewForTodo() async {
    final newTodo = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => UpdateTextView(),
      ),
    );
    if (newTodo != null) {
      setState(() {
        _todos.add(newTodo);
      });
      _loadTodos();
    }
  }

  Future<void> _refreshTodos() async {
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
        onPressed: _openUpdateTextViewForTodo,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: RefreshIndicator(
        onRefresh: _refreshTodos,
        child: ListView.builder(
          itemCount: _todos.length,
          itemBuilder: (context, index) {
            final todo = _todos[index];
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
        ),
      ),
    );
  }
}
