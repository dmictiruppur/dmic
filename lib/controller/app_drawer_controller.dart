//import 'package:kannada_devangar/core/auth_store.dart';
//import 'package:get/state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:get/get.dart';

class AppDrawerController extends GetxController {
  AppDrawerController get to => Get.find();
  //final AuthStore _authStore;
  //AppDrawerController(this._authStore);
  SharedPreferences sharedPreferences;
  RxString MemberName = "".obs;
  RxString RegistrationId = "".obs;
  //final appState = Rx<AppState>();

  @override
  void onInit() {
    checkLoginStatus();
    super.onInit();
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    RegistrationId.value =
        sharedPreferences.getString("RegistrationId").toString();
    MemberName.value = sharedPreferences.getString("MemberName").toString();
  }

  /*void logout() async {
    try {
      //appState.value = AppState.LOADING;
      await _authStore.logout();
      //appState.value = AppState.DONE;
    } on Exception catch (_) {
      //appState.value = AppState.ERROR;
    }
  }*/

  /*void logout_user() async {
    try {
      //appState.value = AppState.LOADING;
      await _authStore.logout();
      //appState.value = AppState.DONE;
    } on Exception catch (_) {
      //appState.value = AppState.ERROR;
    }
  }*/
}
