import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kannada_devangar/controller/profile_image_controller.dart';
import 'package:kannada_devangar/utility/app_drawer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:kannada_devangar/widget/aadhar_image_upload_screen.dart';

class AadharImageScreen extends GetView<ProfileImageController> {
  final ProfileImageController _controller = Get.put(ProfileImageController());

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Aadhar Image Upload"),
          backgroundColor: Colors.blue,
        ),
        drawer: AppDrawer(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Container(
              height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //buildGridView(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Card(
                        elevation: 5,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                    width: 150,
                                    height: 150,
                                    child: Obx(
                                      () => _controller.AadharCardImage_new
                                                  .toString() !=
                                              "null"
                                          ? Container(
                                              width: 150.0,
                                              height: 150.0,
                                              child: CachedNetworkImage(
                                                imageUrl: _controller
                                                        .AadharCardImage_new
                                                    .toString(),
                                                placeholder: (context, url) =>
                                                    Center(
                                                        child:
                                                            new CircularProgressIndicator()),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        new Icon(Icons.error),
                                              ),
                                            )
                                          : IconButton(
                                              icon: Icon(Icons.add_a_photo),
                                              iconSize: 20,
                                              color: Colors.green,
                                              onPressed: () {
                                                Get.to(AadharImageUploadScreen());
                                              },
                                            ),
                                    ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Obx(() =>
                                    _controller.AadharCardImage_new.toString() !=
                                            "null"
                                        ? IconButton(
                                            icon: Icon(Icons.remove_circle),
                                            iconSize: 20,
                                            color: Colors.red,
                                            onPressed: () {
                                              _controller.DeleteAadharPhoto(
                                                  _controller.RegistrationId
                                                      .toString());
                                            },
                                          )
                                        : IconButton(
                                            icon: Icon(Icons.add_a_photo),
                                            iconSize: 20,
                                            color: Colors.green,
                                            onPressed: () {
                                              Get.to(AadharImageUploadScreen());
                                            },
                                          ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
