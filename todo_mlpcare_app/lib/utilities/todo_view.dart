import 'package:flutter/material.dart';
import 'package:todo_mlpcare_app/cosntant/app_const/theme.dart';
import 'package:todo_mlpcare_app/data/tododata.dart';

class ToDoView extends StatefulWidget {
  final Todo todo;
  final Function(bool?)? ondegistirildi;
  final VoidCallback? silmeIslevi;
  final VoidCallback onTap;

  const ToDoView({
    super.key,
    required this.todo,
    required this.ondegistirildi,
    required this.silmeIslevi,
    required this.onTap,
  });

  @override
  State<ToDoView> createState() => _ToDoViewState();
}

class _ToDoViewState extends State<ToDoView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Center(
        child: GestureDetector(
          onTap: widget.onTap,
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: DarkAppTheme.TodoColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Checkbox(
                  value: widget.todo.isDone,
                  onChanged: widget.ondegistirildi,
                  activeColor: Colors.lightBlueAccent,
                  side: const BorderSide(color: Colors.white),
                ),
                Icon(widget.todo.icon, color: Colors.white),
                const SizedBox(
                  width: 15,
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: Text(
                    widget.todo.title,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        decoration: widget.todo.isDone
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                        decorationColor: Colors.red,
                        decorationThickness: 2),
                  ),
                ),
                IconButton(
                  onPressed: () => widget.silmeIslevi!(),
                  icon: const Icon(
                    Icons.delete_outline_outlined,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
