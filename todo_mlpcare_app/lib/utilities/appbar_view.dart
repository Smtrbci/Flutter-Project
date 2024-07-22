import 'package:flutter/material.dart';
import 'package:todo_mlpcare_app/cosntant/app_const/text.dart';
import 'package:todo_mlpcare_app/cosntant/app_const/theme.dart';

class AppBarView extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const AppBarView({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(Texts.AppBarName,
      style: TextStyle(fontWeight: TextStyles.TextBold)),
      centerTitle: true,
      backgroundColor: DarkAppTheme.AppBarColor,
      elevation: 1,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
