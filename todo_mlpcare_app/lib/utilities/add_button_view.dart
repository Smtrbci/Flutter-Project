import 'package:flutter/material.dart';

class addButtonView extends StatelessWidget {
  final String yazi;
  VoidCallback buttonbasma;
  addButtonView({
    super.key,
    required this.yazi,
    required this.buttonbasma,
  });
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: buttonbasma,
      child: Text(
        yazi,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}
