import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:futurehttp/model/post.dart';
import 'package:http/http.dart' as http;

class JsonPlaceHolderView extends StatefulWidget {
  const JsonPlaceHolderView({Key? key}) : super(key: key);

  @override
  State<JsonPlaceHolderView> createState() => _JsonPlaceHolderViewState();
}

class _JsonPlaceHolderViewState extends State<JsonPlaceHolderView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<PostData?> getJsonPlaceHolderDatas() async {
    final _response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/posts/1"));
        if (_response.statusCode == 404) {
      return null;
      }
    final _mapJson = json.decode(_response.body);
    var post = PostData.fromJson(_mapJson);
    return post;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center, child: _placeHolderDatasWidget),
    );
  }

  Widget get _placeHolderDatasWidget => FutureBuilder<PostData>(
        future: getJsonPlaceHolderDatas(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListTitle(
              title: Text(snapshot.data.title),
              subtitle: Text(snapshot.data.body),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      );
}
