import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kannada_devangar/core/custom_snackbar.dart';
import 'package:kannada_devangar/models/member_login_model.dart';
import 'package:kannada_devangar/services/login_service.dart';
import 'package:kannada_devangar/utility/app_routers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MemberRegisterController extends GetxController {
  MemberRegisterController get to => Get.find();
  var isLoading = false.obs;
  SharedPreferences sharedPreferences;
  final username = ''.obs;
  final password = ''.obs;
  final emailid = ''.obs;
  final mobileno = ''.obs;

  void changeUsername(String value) => username.value = value;
  void changePassword(String value) => password.value = value;
  void changeEmailId(String value) => emailid.value = value;
  void changeMobileNo(String value) => mobileno.value = value;

  final memberloginlist = List<MemberLoginModel>().obs;

  bool get usernameIsValid {
    if (username.value.isNotEmpty && username.value.length < 12) return false;
    return true;
  }

  bool get mobilenoIsValid {
    if (mobileno.value.isNotEmpty && mobileno.value.length < 10) return false;
    return true;
  }

  bool get passwordIsValid {
    if (password.value.isNotEmpty && password.value.length < 6) return false;
    return true;
  }

  bool get EmailIdIsValid {
    if (emailid.value.isNotEmpty && emailid.value.length < 6) {
      //print(emailid.value);
      return false;
    }
    else if(validateEmail(emailid.value) == false){
      return false;
    }
    else {
      return true;
    }
  }

  bool get formLoginIsValid =>
      usernameIsValid &&
          passwordIsValid &&
          EmailIdIsValid &&
          mobilenoIsValid &&
          username.value.isNotEmpty &&
          emailid.value.isNotEmpty &&
          mobileno.value.isNotEmpty &&
          password.value.isNotEmpty;

  Future MemberSignupFunction(String UserName, String Password, String EmailId, String MobileNo) async {
    isLoading(true);
    try{
      var todos1 = await LoginService.MemberSignup(UserName.toString(), Password.toString(), EmailId.toString(), MobileNo.toString());
      print(todos1);
      if(todos1 != null) {
        isLoading(false);
        CustomSnackBar().ShowSuccessSnackBar("Success", todos1['message']);
        Get.toNamed(Routes.loginview);
      }
      else{
        //CustomSnackBar().ShowFailureSnackBar("Failure", "Problem in Registration...");
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

bool validateEmail(String value) {
  Pattern pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value) || value == null) {
    return false;
  }
  else {
    return true;
  }
}