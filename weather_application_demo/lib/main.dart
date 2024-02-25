import 'package:flutter/material.dart';
import 'package:weather_application_demo/view/home_view.dart';
//import 'package:weather/weather.dart';
//import 'package:intl/intl_browser.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home_Widget(),
    );
  }
}
