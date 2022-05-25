import 'package:flutter/material.dart';

import '../model/todos_model.dart';
import '../product/companents/text/app_text_strings.dart';
import '../service/todos_service.dart';

class ToDosView extends StatefulWidget {
  const ToDosView({Key? key}) : super(key: key);

  @override
  State<ToDosView> createState() => _ToDosViewState();
}

class _ToDosViewState extends State<ToDosView> {
  final ToDosService _toDosService = ToDosService();
  List<ToDosModel>? _toDosModel;
  bool isLoading = false;
  bool openText = false;

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  Future<void> init() async {
    _toDosModel = await _toDosService.fetchPost();

    changeLoading();
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hi Github I'm Samet"),
      ),
      body: isLoading
          ? ListView.builder(
              itemCount: _toDosModel?.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    leading: const Icon(Icons.account_circle_outlined),
                    title: Text(
                      _toDosModel?[index].title ?? AppString().nullData,
                      overflow: TextOverflow.ellipsis,
                      maxLines: openText ? 20 : 2,
                    ),
                  ),
                );
              },
            )
          : const SizedBox(),
    );
  }
}