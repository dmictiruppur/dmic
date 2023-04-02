import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kannada_devangar/controller/profile_image_controller.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class FullSizeImageUploadScreen extends StatefulWidget {
  const FullSizeImageUploadScreen({Key key}) : super(key: key);

  @override
  _ProfileImageUploadScreenState createState() =>
      _ProfileImageUploadScreenState();
}

class _ProfileImageUploadScreenState extends State<FullSizeImageUploadScreen> {
  final controller = Get.put(ProfileImageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Full Size Image Upload'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(() => controller.selectedImagePath.value == ''
                  ? Text(
                      'Select Image from mobile gallery',
                      style: TextStyle(fontSize: 20),
                    )
                  : Container(
                      width: 200,
                      height: 200,
                      child: Image.file(
                          File(controller.selectedImagePath.value)))),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 10,
              ),
              /*RaisedButton(
                child: Text(
                  'Gallery',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  controller.getImage(ImageSource.gallery);
                },
              ),*/
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  // Foreground color
                  onPrimary: Colors.white,
                  // Background color
                  primary: Colors.purple,
                ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
                onPressed: () {
                  controller.getImage(ImageSource.gallery);
                },
                child: Text(
                  'Gallery',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              /*RaisedButton(
                child: Text(
                  'Upload Image',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  controller.uploadFullSizeImage();
                },
              ),*/
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  // Foreground color
                  onPrimary: Colors.white,
                  // Background color
                  primary: Colors.purple,
                ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
                onPressed: () {
                  controller.uploadFullSizeImage();
                },
                child: Text(
                  'Upload Image',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
