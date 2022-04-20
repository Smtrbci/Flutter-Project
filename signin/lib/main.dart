import 'package:flutter/material.dart';
import 'package:signin/home/home_sign.dart';
import 'package:signin/sign_in/sign_in.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: homeSign(),
    );
  }
}