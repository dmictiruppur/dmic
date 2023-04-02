import 'package:get/get.dart';
import 'package:kannada_devangar/models/auth_model.dart';
import 'package:kannada_devangar/utility/app_routers.dart';
import 'package:kannada_devangar/utility/local_storage_impl.dart';
import 'package:kannada_devangar/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AuthStore extends GetxController {
  AuthStore(this._storage);
  SharedPreferences sharedPreferences;

  static AuthStore get to => Get.find();

  static const TOKEN = 'TOKEN';
  static const USER = 'USER';

  String token;
  UserModel user;
  bool isLoggin;

  final LocalStorage _storage;
  final isLogged = true.obs;

  @override
  void onInit() {
    ever(isLogged, fireRoute);
    super.onInit();
    token = _storage.read(TOKEN);
    user = _storage.read(USER, construct: (map) => UserModel.fromMap(map));
    if (token == null && user == null) {
      isLogged.value = false;
    }
  }

  fireRoute(logged) {
    if (!logged) {
      Get.toNamed(Routes.INITIAL);
    }
  }

  void save(AppModel app) {
    saveUser(app.user);
    saveToken(app.jwt);
    update();
  }

  void save_Users(UserModel user) async {
    await _storage.write(USER, user.toMap());
    this.user = user;
    update();
  }

  void saveUser(UserModel user) async {
    await _storage.write(USER, user.toMap());
    this.user = user;
    update();
  }

  void saveToken(String token) async {
    await _storage.write(TOKEN, token);
    this.token = token;
    update();
  }

  Future<void> logout() async {
    //CartStore.to.clear();
    await _storage.remove(USER);
    await sharedPreferences.clear();
    //await _storage.remove(TOKEN);
    user = null;
    token = null;
    isLogged.value = false;
    update();
    Get.offNamedUntil(Routes.INITIAL, (route) => false);
  }
}
