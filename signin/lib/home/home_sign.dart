import 'package:flutter/material.dart';
import 'color/app_color.dart';

class homeSign extends StatefulWidget {
  const homeSign({Key? key}) : super(key: key);

  @override
  State<homeSign> createState() => _homeSignState();
}

class _homeSignState extends State<homeSign> {
  String _textForm2 = "It seems as this is your first time using our app, please enter your location so we can filter our results and stock accordingly to your local store.";
  String _textForm3 = "If you choose to skip, you can change yourlocation at any time in your account settings.";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Column(
        children: [
          _helpUsHelpYouText(),
          _textForm(),
          _stateTextFormField(),
          _cityTextFormField(),
          _skipTextButton(),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
    );
  }

  _textForm() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children:[
          Text(
            _textForm2,
            style: const TextStyle(
                color: AppColor.mainTextColor , fontSize: 15),
          ),
          SizedBox(height: 20.0),
          Text(
            _textForm3,
            style: const TextStyle(
                color: AppColor.mainTextColor, fontSize: 15),
          ),
        ],
      ),
    );
  }

  _skipTextButton() {
    return Row(
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

  _helpUsHelpYouText() {
    return const Padding(
      padding: EdgeInsets.only(left: 20.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          "Help Us Help You",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
    );
  }
}
