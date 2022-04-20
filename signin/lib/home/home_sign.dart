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
          _helpUsHelpYouText(),
          _firstText(),
          _secondText(),
        ],
      ),
    );
  }

  Container _secondText() {
    return Container(
          child: const Padding(
            padding: EdgeInsets.all(20.0),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "If you choose to skip, you can change yourlocation at any time in your account settings.",
                style: TextStyle(
                    color: Color.fromARGB(75, 33, 33, 33), fontSize: 15),
              ),
            ),
          ),
        );
  }

  Container _firstText() {
    return Container(
          child: const Padding(
            padding: EdgeInsets.all(20.0),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "It seems as this is your first time using our app, please enter your location so we can filter our results and stock accordingly to your local store.",
                style: TextStyle(
                    color: Color.fromARGB(75, 33, 33, 33), fontSize: 15),
              ),
            ),
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
