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
        title: const Text('Vücut Kitle Endeksi Hesaplama'),
        backgroundColor: const Color.fromARGB(190, 91, 136, 103),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: const Color.fromARGB(255, 182, 214, 185),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'CM cinsinden yükseklik',
                icon: Image.asset("assets/height.png"),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'KG cinsinden ağırlık',
                icon: Image.asset("assets/weight.png"),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              //color: Colors.pinkAccent,
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(190, 91, 136, 103))),
              child: const Text(
                "Hesapla",
              ),
              onPressed: calculateBMI,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
                _result == null
                    ? "Değer Girin"
                    : "${_result?.toStringAsFixed(2)}",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                )),
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
