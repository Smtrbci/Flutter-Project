import 'package:flutter/material.dart';

class ToDoView extends StatelessWidget {
  final String taskadi;
  final bool taskTamamlandi;
  Function(bool?)? ondegistirildi;
  final VoidCallback? silmeIslevi;
  ToDoView({
    super.key,
    required this.taskadi,
    required this.taskTamamlandi,
    required this.ondegistirildi,
    required this.silmeIslevi,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
            color: const Color.fromRGBO(66, 85, 99, 50),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Checkbox(
              value: taskTamamlandi,
              onChanged: ondegistirildi,
              activeColor: Colors.lightBlueAccent,
              side: BorderSide(color: Colors.white),
            ),
            Text(
              taskadi,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  decoration: taskTamamlandi
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  decorationColor: Colors.red,
                  decorationThickness: 2),
            ),
            Spacer(),
            IconButton(
              onPressed: () => silmeIslevi!(),
              icon: Icon(
                Icons.delete_outline_outlined,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}