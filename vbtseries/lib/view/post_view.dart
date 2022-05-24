import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../model/post_model.dart';
import '../product/companents/text/app_text_strings.dart';
import '../service/post_service.dart';

class PostView extends StatefulWidget {
  const PostView({Key? key}) : super(key: key);

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  final PostService _postService = PostService();
  List<PostModel>? _postModel;
  bool isLoading = false;
  bool openText = false;

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  Future<void> init() async {
    _postModel = await _postService.fetchPost();

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
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          init();
        },
      ),
      body: isLoading
          ? ListView.builder(
              itemCount: _postModel?.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    leading: FlutterLogo(size: context.mediumValue),
                    title:
                        Text(_postModel?[index].title ?? AppString().nullData),
                    subtitle: InkWell(
                      onTap: () {
                        setState(
                          () {
                            openText = !openText;
                          },
                        );
                      },
                      child: Text(
                        _postModel?[index].body ?? AppString().nullData,
                        style: openText
                            ? const TextStyle()
                            : TextStyle(
                                foreground: Paint()
                                  ..shader = const LinearGradient(
                                    colors: [Colors.grey, Colors.white],
                                  ).createShader(
                                    const Rect.fromLTWH(0, 0, 500, 0),
                                  ),
                              ),
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        maxLines: openText ? 20 : 2,
                      ),
                    ),
                    trailing: const Icon(Icons.account_circle_outlined),
                  ),
                );
              },
            )
          : const SizedBox(),
    );
  }
}
