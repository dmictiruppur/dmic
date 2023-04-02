import 'package:get/get.dart';
import 'package:kannada_devangar/controller/partner_pref_controller.dart';

class PartnerPrefBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<Partner_Pref_Controller>(
      () => Partner_Pref_Controller(),
    );
  }
}
