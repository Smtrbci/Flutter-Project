import 'package:flutter/material.dart';
import 'package:reqresphoto/photo/photos.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Hi Github',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const Photo(),
    );
  }
}