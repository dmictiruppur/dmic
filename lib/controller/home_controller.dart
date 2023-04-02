import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:kannada_devangar/core/urls.dart';

class HomeController extends GetxController {
  static Dio dio = new Dio();
  static HomeController get to => Get.find();

  String CurVer = '1.0.0';
  String NewVer = '';

  void onInit() async {
    GetCurrentVersionNumber();
    super.onInit();
  }

  GetCurrentVersionNumber() async {
    final body = {
      'CurVer': this.CurVer,
    };
    var response = await dio.post(URLs.get_version,
        data: body, options: Options(headers: _setHeaders()));
    if (response.statusCode == 200) {
      var data = response.data;
      print(data + " | " + CurVer);
      if (data != '') {
        if (CurVer != data) {
          Get.snackbar("Success",
              "New Version is available. Please Download the newer version....",
              snackPosition: SnackPosition.TOP,
              backgroundColor: Colors.purple,
              colorText: Colors.white);
        }
      }
    } else {
      return null;
    }
  }
}

_setHeaders() => {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Access-Control_allow_orgin': '*',
    };
