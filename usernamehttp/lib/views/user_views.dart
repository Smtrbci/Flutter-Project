import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../User/user.dart';

Future<User> getUserData() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users/1'));

  if (response.statusCode == 200) {
    return User.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load data');
  }
}

void main() => runApp(const UserHttp());

class UserHttp extends StatefulWidget {
  const UserHttp({Key? key}) : super(key: key);

  @override
  _UserHttpState createState() => _UserHttpState();
}

class _UserHttpState extends State<UserHttp> {
  late Future<User> futureUser;

  @override
  void initState() {
    super.initState();
    futureUser = getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hi Github I'm Samet"),
      ),
      body: Center(
        child: Card(
          child: FutureBuilder(
              future: getUserData(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return const Center(
                    child: Text('Loading...'),
                  );
                } else {
                  return ListTile(
                    title: Text(snapshot.data?.name),
                    subtitle: Text(snapshot.data?.username),
                    trailing: Text(snapshot.data?.email),
                    leading: Text(snapshot.data?.phone),
                  );
                }
              }),
        ),
      ),
    );
  }
}
