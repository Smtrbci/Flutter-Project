import 'package:bmi_calculator_app/veiws/bmi_veiws.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vücut Kitle Endeksi Hesaplama',
      home: BMIVeiws(),
    );
  }
}
