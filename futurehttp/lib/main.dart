import 'package:flutter/material.dart';
import 'package:futurehttp/views/httphello.dart';
import 'package:futurehttp/views/json_placeholder_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: JsonPlaceHolderView()
    );
  }
}