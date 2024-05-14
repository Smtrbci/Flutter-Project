import 'package:flutter/material.dart';
import 'package:todo_mlpcare_app/utilities/add_button_view.dart';

class DialogView extends StatelessWidget {
  final kontroller;
  VoidCallback onKayit;
  VoidCallback onDevam;
  DialogView({
    super.key,
    required this.kontroller,
    required this.onKayit,
    required this.onDevam,
  });
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromRGBO(66, 85, 99, 10),
      title: const Text(
        "Yeni To Do Oluşturma",
        style: TextStyle(color: Colors.white),
      ),
      content: SizedBox(
        height: 180,
        width: 280,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              style: TextStyle(color: Colors.white),
              controller: kontroller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 2.0, color: Colors.white),
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