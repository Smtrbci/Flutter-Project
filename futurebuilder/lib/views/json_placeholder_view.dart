import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

class JsonPlaceHolderView  extends StatefulWidget {
  const JsonPlaceHolderView ({Key? key}) : super(key: key);

  @override
  State<JsonPlaceHolderView > createState() => _JsonPlaceHolderViewState();
}

class _JsonPlaceHolderViewState extends State<JsonPlaceHolderView > {
  Future<List> _loadData() async {
    List posts = [];
    try {
      const API = 'https://jsonplaceholder.typicode.com/posts';

      final http.Response response = await http.get(Uri.parse(API));
      posts = json.decode(response.body);
    } catch (err) {
      print(err);
    }
    return posts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Samet Arabaci'),
      ),
      body: FutureBuilder(
        future: _loadData(),
        builder: (BuildContext ctx, AsyncSnapshot<List> snapshot) =>
            snapshot.hasData
                ? ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (BuildContext context, index) => Card(
                      margin: const EdgeInsets.all(10),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(10),
                        title: Text(snapshot.data?[index]['title']),
                        subtitle: Text(snapshot.data?[index]['body']),
                      ),
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
      ),
    );
  }
}
