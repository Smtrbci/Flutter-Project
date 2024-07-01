import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_mlpcare_app/data/tododata.dart';
import 'package:todo_mlpcare_app/provider/todo_provider.dart';
import 'package:todo_mlpcare_app/routes/app_routes.gr.dart';
import 'package:todo_mlpcare_app/utilities/appbar_view.dart';
import 'package:todo_mlpcare_app/utilities/todo_view.dart';

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
      ref.read(todoProvider).addTodo(
        newTodo.title,
        newTodo.icon
      );
    }
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
      body: Consumer(
        builder: (context, ref, child) {
          final todoListProvider = ref.watch(todoProvider);
          final todoNotifier = ref.read(todoProvider.notifier);
          return RefreshIndicator(
            onRefresh: () async {
              todoNotifier.loadTodos();
            },
            child: ListView.builder(
              itemCount: todoListProvider.todos.length,
              itemBuilder: (context, index) {
                final todo = todoListProvider.todos[index];
                return ToDoView(
                  key: ValueKey(todo.id),
                  todo: todo,
                  ondegistirildi: (value) {
                    todoNotifier.toggleTodoStatus(todo);
                  },
                  silmeIslevi: () {
                    todoNotifier.deleteTodo(todo.id);
                  },
                  onTap: () {
                    _showUpdateTodoView(todo);
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
