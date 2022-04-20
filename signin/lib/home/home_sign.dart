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
          _stateTextFormField(),
          _cityTextFormField(),
          _skipTextButton(),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }

  Container _skipTextButton() {
    return Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Skip",
                  style: TextStyle(
                    color: Color.fromARGB(255, 90, 189, 140),
                  ),
                ),
                style: TextButton.styleFrom(
                  primary: Color.fromARGB(40, 90, 189, 139),
                ),
              )
            ],
          ),
        );
  }

  Padding _cityTextFormField() {
    return Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextFormField(
            decoration: const InputDecoration(
              hintText: "City",
              hintStyle: TextStyle(
                color: Color.fromARGB(75, 33, 33, 33),
              ),
              filled: true,
              fillColor: Color.fromARGB(40, 239, 239, 239),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        );
  }

  Padding _stateTextFormField() {
    return Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextFormField(
            decoration: const InputDecoration(
              hintText: "State",
              hintStyle: TextStyle(
                color: Color.fromARGB(75, 33, 33, 33),
              ),
              filled: true,
              fillColor: Color.fromARGB(40, 239, 239, 239),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
                borderSide: BorderSide.none,
              ),
            ),
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
