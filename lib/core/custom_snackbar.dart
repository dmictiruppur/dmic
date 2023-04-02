import 'package:get/get.dart';
import 'package:flutter/material.dart';

class CustomSnackBar{
  ShowSuccessSnackBar(String TitleMsg, String DetailMsg){
    Get.snackbar(TitleMsg.toString(), DetailMsg.toString(), snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.greenAccent, colorText: Colors.white);
  }

  ShowFailureSnackBar(String TitleMsg, String DetailMsg){
    Get.snackbar(TitleMsg.toString(), DetailMsg.toString(), snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red, colorText: Colors.white);
  }
}