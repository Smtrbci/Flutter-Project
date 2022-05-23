import 'package:flutter/material.dart';
import 'package:reqresphoto/viewModel/reqres_photo_view_model.dart';

class ReqresPhotoView extends ReqresPhotosViewModel {
  @override
  Widget build(BuildContext context) {
    // Replace this with your build function
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hi Github I'm Photo"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          allPhoto();
        },
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: photo.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Column(
              children: [
                Image.network("${photo[index].thumbnailUrl}"),
                Center(
                  child: Text(
                    "${photo[index].title}",
                    style: const TextStyle(fontSize: 10),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}