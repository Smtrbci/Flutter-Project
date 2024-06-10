import 'package:flutter/material.dart';

class AppBarView extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const AppBarView({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'To Do MLPCare',
        style: TextStyle(color: Colors.white),
      ),
      centerTitle: true,
      backgroundColor: const Color.fromRGBO(66, 85, 99, 50),
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
