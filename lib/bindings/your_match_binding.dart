import 'package:get/get.dart';
import 'package:kannada_devangar/controller/your_match_controller.dart';
import 'package:kannada_devangar/repositories/user_repository.dart';
import 'package:kannada_devangar/utility/http_client.dart';

class YourMatchBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<UserRepository>(
      () => UserRepositoryImpl(Get.find<HttpClient>()),
    );

    Get.lazyPut<Your_Match_Controller>(
        () => Your_Match_Controller(Get.find<UserRepository>()));
  }
}
