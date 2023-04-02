//import 'package:delivery_app_getx/features/user/presentation/register/register_controller.dart';
import 'package:get/get.dart';
import 'package:kannada_devangar/utility/http_client.dart';
import 'package:kannada_devangar/repositories/auth_repository.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(
        () => AuthRepositoryImpl(Get.find<HttpClient>()));
    /*Get.lazyPut<LoginController>(
      () => LoginController(
        Get.find<UserRepository>(),
      ),
    );*/
    /*Get.lazyPut<RegisterController>(
      () => RegisterController(
        Get.find<AuthRepository>(),
      ),
    );*/
  }
}
