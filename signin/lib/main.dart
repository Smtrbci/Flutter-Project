import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:signin/home/home_sign.dart';
import 'package:signin/sign_in/sign_in.dart';
import 'codelabs/startup_namer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Startup Name Generator',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Startup Name Generator'),
          backgroundColor: Colors.blueGrey,
        ),
        body: const Center(
          child: RandomWords(),
        ),
        backgroundColor: Colors.blueGrey[300]
      ),
    );
  }
}