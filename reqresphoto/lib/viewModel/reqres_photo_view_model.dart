import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';
import '../model/reqres_photo_model.dart';
import '../photo/photos.dart';

abstract class ReqresPhotosViewModel extends State<Photo> {
  INetworkManager manager = NetworkManager(
      isEnableLogger: true,
      options: BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com"));
  List<PhotoModel> photo = [];
  Future<void> allPhoto() async {
    final response = await manager.send<PhotoModel, List<PhotoModel>>(
        "/photos",
        parseModel: PhotoModel(),
        method: RequestType.GET);
    photo = response.data ?? [];
    setState(() {});
  }
}