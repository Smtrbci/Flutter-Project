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
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.chevron_left,
              color: Colors.tealAccent[400],
            ),
          ),
        ),
        body: Column(
          children: [
            Container(
              child: Align(
                alignment: Alignment.topLeft,
                child: const Text(
                  "Sign In",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
            ),
            const Expanded(
              flex: 0,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Optional Group Special Code",
                    filled: true,
                    fillColor: Color.fromARGB(179, 200, 200, 200),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
            const Expanded(
              flex: 0,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Email Address",
                    filled: true,
                    fillColor: Color.fromARGB(179, 200, 200, 200),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
            const Expanded(
              flex: 0,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Password",
                    filled: true,
                    fillColor: Color.fromARGB(179, 200, 200, 200),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              child: Row(
                children: const [
                  Expanded(
                    flex: 3,
                    child: Text(
                      "Stay Logged In",
                    ),
                  ),
                  Expanded(
                    flex: 0,
                    child: Text(
                      "Forgot Your Password ?",
                    ),
                  ),
                ],
              ),
            ),
            ],
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
