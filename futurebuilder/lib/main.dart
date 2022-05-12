import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'dart:convert';

import 'views/json_placeholder_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Samet Arabaci',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: JsonPlaceHolderView (),
    );
  }
}