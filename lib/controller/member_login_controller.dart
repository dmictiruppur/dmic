import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kannada_devangar/core/custom_snackbar.dart';
import 'package:kannada_devangar/models/member_login_model.dart';
import 'package:kannada_devangar/services/login_service.dart';
import 'package:kannada_devangar/utility/app_routers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MemberLoginController extends GetxController {
  MemberLoginController get to => Get.find();
  var isLoading = false.obs;
  SharedPreferences sharedPreferences;
  final username = ''.obs;
  final password = ''.obs;

  void changeUsername(String value) => username.value = value;
  void changePassword(String value) => password.value = value;

  final memberloginlist = List<MemberLoginModel>().obs;

  bool get usernameIsValid {
    if (username.value.isNotEmpty && username.value.length < 12) return false;
    return true;
  }

  bool get passwordIsValid {
    if (password.value.isNotEmpty && password.value.length < 6) return false;
    return true;
  }

  bool get formLoginIsValid =>
      usernameIsValid &&
          passwordIsValid &&
          username.value.isNotEmpty &&
          password.value.isNotEmpty;

  Future MemberLoginFunction(String UserName, String Password) async {
    isLoading(true);
    try{
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      var todos1 = await LoginService.MemberLogin(UserName.toString(), Password.toString());
      //print(todos1);
      if(todos1 != null) {
        memberloginlist.assign(todos1);
        //print(todos1.registrationId);
        sharedPreferences.setString('RegistrationId', todos1.registrationId);
        sharedPreferences.setString('MemberName', todos1.memberNameEn);
        sharedPreferences.setString('ProfilePhoto1', todos1.profilePhotoImageNew);
        sharedPreferences.setString('ProfilePhoto2', todos1.fullSizePhotoNew);
        sharedPreferences.setString('RegCode', todos1.regCode);
        sharedPreferences.setBool('IsLoggedIn', true);
        isLoading(false);
        Get.toNamed(Routes.homeView, arguments: memberloginlist);
      }
      else{
        CustomSnackBar().ShowFailureSnackBar("Failure", "Invalid Login Detail....");
        isLoading(false);
      }
    }
    catch (e) {
      print("ERRR: " + e.toString());
      CustomSnackBar().ShowFailureSnackBar("Failure", e.toString());
      isLoading(false);
    }
    finally{
      isLoading(false);
    }
  }
}