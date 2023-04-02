import 'package:get/get.dart';
import 'package:kannada_devangar/models/member_profile_view_model.dart';
import 'package:kannada_devangar/services/member_search_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

import 'myprofile_controller.dart';

class MyProfileEditController extends GetxController {
  SharedPreferences sharedPreferences;
  //static MyProfileEditController get to => Get.find<MyProfileEditController>();
  //final smdetail_list = List<MemberProfileViewModel>().obs;
  //static MyProfileEditController get to => Get.find<MyProfileEditController>();
  static MyProfileEditController get to => Get.find();
  final RegistrationId = "".obs;
  var isLoading = true.obs;

  RxString txt_AboutMySelf = "I am Nagaraj".obs;

  //var AboutMySelfController = TextEditingController();

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
    isLoading(true);
    try {
      var todos1 = await MyApiClient.FetchSMyProfileData(RegistrationId.toString());
      //smdetail_list.assign(todos1);
      //print(smdetail_list[0].aboutMySelf);
      //print(todos1.aboutMySelf.toString());
      txt_AboutMySelf(todos1.aboutMySelf.toString());
      //print(txt_AboutMySelf.value);
      isLoading(false);
      update();
      //Get.back();
    } finally {
      isLoading(false);
    }
  }

  SaveProfileEdit(){
    print(
        "Save - " + txt_AboutMySelf.value.toString()
    );
  }
}
