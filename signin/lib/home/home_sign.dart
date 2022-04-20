import 'package:flutter/material.dart';

class homeSign extends StatefulWidget {
  const homeSign({Key? key}) : super(key: key);

  @override
  State<homeSign> createState() => _homeSignState();
}

class _homeSignState extends State<homeSign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          _helpUsHelpYouText()
        ],
      ),
    );
  }

  Container _helpUsHelpYouText() {
    return Container(
          child: const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Help Us Help You",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
          ),
        );
  }
}
