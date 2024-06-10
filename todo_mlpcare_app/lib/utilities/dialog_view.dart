import 'package:flutter/material.dart';
import '../utilities/add_button_view.dart';

class DialogView extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onKayit;
  final VoidCallback onDevam;

  const DialogView({
    super.key,
    required this.controller,
    required this.onKayit,
    required this.onDevam,
  });



  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromRGBO(66, 85, 99, 1),
      title: const Text(
        "Yeni ToDo Oluşturma",
        style: TextStyle(color: Colors.white),
      ),
      content: SizedBox(
        height: 180,
        width: 280,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              style: const TextStyle(color: Colors.white),
              controller: controller,
              decoration: const InputDecoration(
                //fillColor: Colors.white, filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 10.0, color: Colors.white),
                ),
                hintText: "Lütfen Yazınız",
                hintStyle: TextStyle(color: Colors.white),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                addButtonView(yazi: "Vazgeç", buttonbasma: onDevam),
                const SizedBox(
                  width: 13,
                ),
                addButtonView(yazi: "Kaydet", buttonbasma: onKayit),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
