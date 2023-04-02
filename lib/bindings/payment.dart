import 'package:get/get.dart';
import 'package:kannada_devangar/controller/payment_controller.dart';
import 'package:kannada_devangar/repositories/user_repository.dart';
import 'package:kannada_devangar/utility/http_client.dart';

class PaymentBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<UserRepository>(
      () => UserRepositoryImpl(Get.find<HttpClient>()),
    );

    Get.lazyPut<Payment_Controller>(
        () => Payment_Controller());
  }
}
