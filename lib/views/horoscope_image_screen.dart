import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kannada_devangar/controller/profile_image_controller.dart';
import 'package:image_picker/image_picker.dart';

class HoroscopeImageScreen extends GetView<ProfileImageController> {
  List<Object> images = List<Object>();
  Future<File> _imageFile;

  @override
  Widget build(BuildContext context) {

    images.add("Add Image");
    images.add("Add Image");
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Horoscope Image Upload"),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildGridView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildGridView() {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      childAspectRatio: 1,
      children: List.generate(images.length, (index) {
        if (images[index] is ImageUploadModel) {
          ImageUploadModel uploadModel = images[index];
          return Card(
            clipBehavior: Clip.antiAlias,
            child: Stack(
              children: <Widget>[
                Image.file(
                  uploadModel.imageFile,
                  width: 300,
                  height: 300,
                ),
                Positioned(
                  right: 5,
                  top: 5,
                  child: InkWell(
                    child: Icon(
                      Icons.remove_circle,
                      size: 20,
                      color: Colors.red,
                    ),
                    onTap: () {
                      images.replaceRange(index, index + 1, ['Add Image']);
                    },
                  ),
                ),
              ],
            ),
          );
        } else {
          return Card(
            child: IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                //_onAddImageClick(index);
              },
            ),
          );
        }
      }),
    );
  }

  void getFileImage(int index) async {
//    var dir = await path_provider.getTemporaryDirectory();
    _imageFile.then((file) async {
      ImageUploadModel imageUpload = new ImageUploadModel();
      imageUpload.isUploaded = false;
      imageUpload.uploading = false;
      imageUpload.imageFile = file;
      imageUpload.imageUrl = '';
      images.replaceRange(index, index + 1, [imageUpload]);
    });
  }
}

class ImageUploadModel {
  bool isUploaded;
  bool uploading;
  File imageFile;
  String imageUrl;

  ImageUploadModel({
    this.isUploaded,
    this.uploading,
    this.imageFile,
    this.imageUrl,
  });
}