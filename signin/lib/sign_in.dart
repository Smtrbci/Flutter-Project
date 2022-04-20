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
            icon: const Icon(
              Icons.chevron_left,
              color: Color.fromARGB(255, 90, 189, 140),
            ),
          ),
        ),
        body: Column(
          children: [
            Container(
              child: const Align(
                alignment: Alignment.topLeft,
                child: Text(
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
                    fillColor: Color.fromARGB(40, 239, 239, 239),
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
                    fillColor: Color.fromARGB(40, 239, 239, 239),
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
            const SizedBox(height: 16),
            OutlinedButton(
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
            ),
          ],
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
