import 'package:flutter/material.dart';

class BMIVeiws extends StatefulWidget {
  const BMIVeiws({super.key});

  @override
  State<BMIVeiws> createState() => _BMIVeiwsState();
}

class _BMIVeiwsState extends State<BMIVeiws> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  double? _result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Vücut Kitle İndeksi Hesaplama',
          style: TextStyle(
            color: Color.fromARGB(200, 32, 46, 95),
          ),
        ),
        backgroundColor: const Color.fromARGB(200, 166, 201, 199),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Color.fromARGB(220, 166, 201, 199),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("assets/vkii.png"),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'CM Cinsinden Yükseklik',
                labelStyle: TextStyle(color: Colors.black),
                icon: Image.asset("assets/height.png"),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 0.0),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'KG Cinsinden Ağırlık',
                labelStyle: TextStyle(color: Colors.black),
                icon: Image.asset("assets/weight.png"),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 0.0),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              //color: Colors.pinkAccent,
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(200, 166, 201, 199))),
              onPressed: calculateBMI,
              child: const Text(
                "Hesapla",
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(200, 32, 46, 95),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 1.2,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                _result == null
                    ? "Değer Girin"
                    : "${_result?.toStringAsFixed(2)}",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 35,
                  fontWeight: _result == null ? FontWeight.normal : FontWeight.normal,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void calculateBMI() {
    double height = double.parse(_heightController.text) / 100;
    double widget = double.parse(_weightController.text);

    double heightSquare = height * height;
    double result = widget / heightSquare;
    _result = result;
    setState(() {});
  }
}
