import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: _appBar(),
        body: Column(
          children: [
            _signInText(),
            _sepecialCodeTextField(),
            _emailTextFeild(),
            _passwordTextField(),
            _singInInfoText(),
            const SizedBox(height: 16),
            _singInButton(),
          ],
        ),
        backgroundColor: Colors.white,
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.chevron_left,
            color: Color.fromARGB(255, 90, 189, 140),
          ),
        ),
      );
  }

  Container _signInText() {
    return Container(
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Sign In",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
            ),
          );
  }

    Padding _sepecialCodeTextField() {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Optional Group Special Code",
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

  Padding _emailTextFeild() {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Email Address",
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

  Padding _passwordTextField() {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          hintText: "Password",
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

  Container _singInInfoText() {
    return Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Stay Logged In",
                  ),
                  Text(
                    "Forgot Your Password ?",
                  ),
                ],
              ),
            ),
          );
  }

  OutlinedButton _singInButton() {
    return OutlinedButton(
            onPressed: () {},
            child: const Text(
              'Sing In',
              style: TextStyle(
                  color: Color.fromARGB(255, 90, 189, 140), fontSize: 20),
            ),
            style: OutlinedButton.styleFrom(
              shape: const StadiumBorder(),
              side: const BorderSide(
                color: Color.fromARGB(255, 90, 189, 140),
              ),
              minimumSize: const Size(350, 50),
            ),
          );
  }
}
