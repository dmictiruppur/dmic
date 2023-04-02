import 'package:get/get.dart';
import 'package:kannada_devangar/controller/unlocked_profile_controller.dart';
import 'package:kannada_devangar/repositories/user_repository.dart';
import 'package:kannada_devangar/utility/http_client.dart';

class Unlocked_Profile_Binding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<UserRepository>(
      () => UserRepositoryImpl(Get.find<HttpClient>()),
    );

    Get.lazyPut<Unlocked_Profile_Controller>(
        () => Unlocked_Profile_Controller(Get.find<UserRepository>()));
  }
}
