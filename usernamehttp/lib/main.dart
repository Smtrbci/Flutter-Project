import 'package:flutter/material.dart';
import 'package:usernamehttp/views/user_views.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hi Github',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const UserHttp(),
    );
  }
}