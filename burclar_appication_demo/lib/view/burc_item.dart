import 'package:burclar_appication_demo/model/burc.dart';
import 'package:flutter/material.dart';

class BurcItem extends StatelessWidget {

  final Burc listelenenBurc;

  const BurcItem({required this.listelenenBurc ,super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(listelenenBurc),
      ),
    );
  }
}
