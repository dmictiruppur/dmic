import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kannada_devangar/models/user_model.dart';
import 'package:kannada_devangar/repositories/user_repository.dart';
import 'package:kannada_devangar/utility/app_routers.dart';
import 'package:kannada_devangar/core/auth_store.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.find();

  final UserRepository _repository;

  LoginController(this._repository);

  final username = ''.obs;
  final password = ''.obs;
  //final appState = Rx<AppState>();

  void changeUsername(String value) => username.value = value;
  void changePassword(String value) => password.value = value;

  void authLocal() async {
    try {
      //appState.value = AppState.LOADING;
      UserModel app =
          await _repository.authLocal(username.value.trim(), password.value);
      AuthStore.to.save_Users(app);

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
