import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_mlpcare_app/data/realtimedatabesservice.dart';
import 'package:todo_mlpcare_app/data/tododata.dart';

final todoProvider = ChangeNotifierProvider<TodoProvider>((ref) {
  return TodoProvider();
});

class TodoProvider extends ChangeNotifier {
  final RealtimeDatabaseService _databaseService = RealtimeDatabaseService();
  List<Todo> _todos = [];
  List<Todo> get todos => _todos;

  TodoProvider() {
    loadTodos();
  }

  void loadTodos() async {
    _todos = await _databaseService.getTodos();
    notifyListeners();
  }

  void addTodo(String title, IconData? icon) async {
    final newTodo = Todo(
      id: _databaseService.generateId(),
      title: title,
      icon: icon,
    );
    await _databaseService.addTodo(newTodo);
    _todos.add(newTodo);
    notifyListeners();
  }

  void toggleTodoStatus(Todo todo) async {
    todo.isDone = !todo.isDone;
    await _databaseService.updateTodo(todo);
    loadTodos();
  }

  void deleteTodo(String id) async {
    await _databaseService.deleteTodo(id);
    loadTodos();
  }

  void updateTodo(Todo todo) async {
    await _databaseService.updateTodo(todo);
    loadTodos();
  }
}
