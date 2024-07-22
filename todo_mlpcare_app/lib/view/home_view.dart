import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_mlpcare_app/cosntant/app_const/theme.dart';
import 'package:todo_mlpcare_app/data/tododata.dart';
import 'package:todo_mlpcare_app/provider/todo_provider.dart';
import 'package:todo_mlpcare_app/routes/app_routes.gr.dart';
import 'package:todo_mlpcare_app/utilities/appbar_view.dart';
import 'package:todo_mlpcare_app/utilities/todo_view.dart';

import '../cosntant/app_const/icon.dart';

@RoutePage()
class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _showUpdateTodoView(Todo todo) async {
    final updatedTodo = await context.router.push(
      UpdateTextView(todo: todo),
    );
    if (updatedTodo is Todo) {
      ref.read(todoProvider.notifier).updateTodo(updatedTodo);
    }
  }

  void _openUpdateTextViewForTodo() async {
    final newTodo = await context.router.push(
      UpdateTextView(),
    );
    if (newTodo is Todo) {
      ref.read(todoProvider).addTodo(newTodo.title, newTodo.icon);
    }
  }

  @override
  Widget build(BuildContext context) {
    var provider = ref.watch(todoProvider);

    return Scaffold(
      backgroundColor: DarkAppTheme.CenterColor,
      appBar:  const AppBarView(
        title: "",
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: DarkAppTheme.ButtonColor,
        onPressed: _openUpdateTextViewForTodo,
        child: Icon(
          IconList.todoadd,
          color: DarkAppTheme.IconColor,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: RefreshIndicator(
        onRefresh: () async {
          provider.loadTodos();
        },
        child: ListView.builder(
          itemCount: provider.todos.length,
          itemBuilder: (context, index) {
            final todo = provider.todos[index];
            return ToDoView(
              key: ValueKey(todo.id),
              todo: todo,
              ondegistirildi: (value) {
                provider.toggleTodoStatus(todo);
              },
              silmeIslevi: () {
                provider.deleteTodo(todo.id);
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
