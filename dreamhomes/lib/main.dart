import 'package:dreamhomes/views/dream_homes_views.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dream Homes Samet',
      home: DreamHomes(),
    );
  }
}