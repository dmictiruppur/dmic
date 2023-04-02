import 'package:get/get.dart';
import 'package:kannada_devangar/repositories/user_repository.dart';
import 'package:kannada_devangar/utility/http_client.dart';

class SearchBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<UserRepository>(
      () => UserRepositoryImpl(Get.find<HttpClient>()),
    );

    /*Get.lazyPut<Search_Controller>(
        () => Search_Controller(Get.find<UserRepository>()));*/
  }
}
