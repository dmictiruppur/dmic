import 'package:get/get.dart';
import 'package:kannada_devangar/controller/orderdetail_controller.dart';
import 'package:kannada_devangar/core/open_url.dart';
import 'package:kannada_devangar/models/package_model.dart';
import 'package:kannada_devangar/services/member_search_provider.dart';
import 'package:kannada_devangar/widget/trackandpay.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:kannada_devangar/core/urls.dart';

class Payment_Controller extends GetxController {
  static Payment_Controller get to => Get.find();
  static OrderDetailController get odc => Get.find();
  RxString RegistrationId = "".obs;
  RxString OrderId = "".obs;
  RxString OrderDetailId = "".obs;

  final PackageList1 = List<PackageModel>().obs;
  final PackageList2 = List<PackageModel>().obs;
  RxBool isLoading = true.obs;
  SharedPreferences sharedPreferences;

  @override
  void onInit() async {
    // TODO: implement onInit
    sharedPreferences = await SharedPreferences.getInstance();
    SetRegistrationId(sharedPreferences.getString("RegistrationId").toString());
    await fetchPackageList1(RegistrationId.toString(), "3");
    await fetchPackageList1(RegistrationId.toString(), "1");
    odc.fetchBasicDetail(RegistrationId.toString());
    super.onInit();
  }

  SetRegistrationId(String RegistrationIds) {
    RegistrationId(RegistrationIds);
  }

  SetOrderId(String OrderIds) {
    OrderId(OrderIds);
  }

  SetOrderDetailId(String OrderDetailIds) {
    OrderDetailId(OrderDetailIds);
  }

  /*Future fetch_Orderdetail_new(String RegistrationId) async {
    isLoading(true);
    try {
      var data = await MyApiClient.GetOrderDetail_New_WithoutModel(
          RegistrationId.toString());
      //print(data);
      //print(data['OrderDetailId']);
      SetOrderId(data['OrderId'].toString());
      SetOrderDetailId(data['OrderDetailId'].toString());
    } finally {
      isLoading(false);
    }
  }*/

  fetchPackageList1(String RegistrationId, String PaymentTypeId) async {
    isLoading(true);
    try {
      var todos1 = await MyApiClient.FetchPaymentType(RegistrationId.toString(), PaymentTypeId.toString());
      if(PaymentTypeId == "1") {
        PackageList1.assign(todos1);
      }
      else{
        PackageList2.assign(todos1);
      }
      isLoading(false);
      update();
      //return smdetail_list_new;
      //final result = await Get.to<String>(SearchMemberDetailPage(), arguments: smdetail_list_new);
    } finally {
      isLoading(false);
    }
  }

  AcceptPayment(String PaymentTypeId, String OrderId, String OrderDetailId, String Cost1, String RenwalCost) async{
    //print(OrderId);
    //print(OrderId + " = " + Cost1 + ' == ' + RenwalCost);
    if(int.parse(OrderId) > 0){
      //final result = await Get.to<String>(TracknPayScreen(RegistrationId: RegistrationId.toString(), OrderId: OrderId, OrderDetailId: OrderDetailId, PackageId: PaymentTypeId, PackageCost: RenwalCost));
      final result = await Get.offAll<String>(TracknPayScreen(RegistrationId: RegistrationId.toString(), OrderId: OrderId, OrderDetailId: OrderDetailId, PackageId: PaymentTypeId, PackageCost: RenwalCost));
      //OpenUrl().launchURL(URLs.paymentGateway_tracknpay + '?processTopUp=1&RegistrationId=' + RegistrationId.toString() + '&OrderId=' + OrderId.toString() + '&PackageId=' + PaymentTypeId.toString() + '&IsTopUp=1&OrderDetailId=' + OrderDetailId.toString() + '&PackageCost=' + RenwalCost.toString());
    }
    else{
      //final result = await Get.to<String>(TracknPayScreen(RegistrationId: RegistrationId.toString(), OrderId: OrderId.toString(), OrderDetailId: OrderDetailId.toString(), PackageId: PaymentTypeId.toString(), PackageCost: Cost1.toString()));
      //OpenUrl().launchURL(URLs.paymentGateway_tracknpay + '?processTopUp=1&RegistrationId=' + RegistrationId.toString() + '&OrderId=' + OrderId.toString() + '&PackageId=' + PaymentTypeId.toString() + '&IsTopUp=1&OrderDetailId=' + OrderDetailId.toString() + '&PackageCost=' + Cost1.toString());
    }
  }
}
