import 'package:get/get.dart';
import 'package:kannada_devangar/models/member_profile_view_model.dart';
import 'package:kannada_devangar/services/member_search_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class MyProfileController extends GetxController {
  SharedPreferences sharedPreferences;
  static MyProfileController get to => Get.find<MyProfileController>();
  final RegistrationId = "".obs;
  final smdetail_list = List<MemberProfileViewModel>().obs;
  var isLoading = true.obs;

  @override
  void onInit() async {
    super.onInit();
    sharedPreferences = await SharedPreferences.getInstance();
    SetRegistrationId(sharedPreferences.getString("RegistrationId").toString());
    await fetch_single_member_detail(RegistrationId.toString());
  }

  SetRegistrationId(String RegistrationIds) {
    RegistrationId(RegistrationIds);
  }

  fetch_single_member_detail(String RegistrationId) async {
    smdetail_list.clear();
    isLoading(true);
    try {
      /*Future.delayed(
          Duration(seconds: 5),
              () => Get.dialog(Expanded(child: Center(child: CircularProgressIndicator())),
              barrierDismissible: false));*/
      //print(RegistrationId + " - " + sRegistrationId);
      var todos1 = await MyApiClient.FetchSMyProfileData(RegistrationId.toString());
      smdetail_list.assign(todos1);
      isLoading(false);
      update();
      //Get.back();
    } finally {
      isLoading(false);
    }
  }
}
