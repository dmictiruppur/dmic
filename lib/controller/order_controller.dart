import 'package:get/get.dart';
import 'package:kannada_devangar/core/urls.dart';
import 'package:kannada_devangar/models/member_order_detail_model.dart';
import 'package:kannada_devangar/services/member_search_provider.dart';
import 'package:dio/dio.dart';

const unlock_profile = URLs.unlock_profile;

class OrderController extends GetxController {
  static Dio dio = new Dio();
  final postsList = List<MemberOrderDetailModel>().obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    //fetch_Orderdetail();
    super.onInit();
  }

  void fetch_Orderdetail(String RegistrationId) async {
    isLoading(true);
    try {
      var todos = await MyApiClient.GetOrderDetail(RegistrationId);
      if (todos != null) {
        postsList.value = todos;
      }
    } finally {
      isLoading(false);
    }
  }
}