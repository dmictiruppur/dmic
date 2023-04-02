import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kannada_devangar/utility/app_routers.dart';
import 'package:kannada_devangar/core/auth_store.dart';
import 'package:kannada_devangar/models/auth_model.dart';
import 'package:kannada_devangar/repositories/auth_repository.dart';

class LoginController_Old extends GetxController {
  static LoginController_Old get to => Get.find();

  final AuthRepository _repository;

  LoginController_Old(this._repository);

  final username = ''.obs;
  final password = ''.obs;
  //final appState = Rx<AppState>();

  void changeUsername(String value) => username.value = value;
  void changePassword(String value) => password.value = value;

  void authLocal() async {
    try {
      //appState.value = AppState.LOADING;
      AppModel app =
          await _repository.authLocal(username.value.trim(), password.value);
      AuthStore.to.save(app);

      Get.offAllNamed(Routes.homeView);
      //appState.value = AppState.DONE;
    } catch (e) {
      Get.snackbar(
        'Error in login',
        'Login detail incorrect ' + e.toString(),
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
      //appState.value = AppState.ERROR;
    }
    //Get.offAllNamed(Routes.homeView);
  }

  bool get usernameIsValid {
    if (username.value.isNotEmpty && username.value.length < 3) return false;
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
}
