import 'package:get/get.dart';
import 'package:kannada_devangar/models/orderdetail_model.dart';
import 'package:kannada_devangar/services/order_detail_service.dart';
import 'package:kannada_devangar/services/unlock_projfile_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderDetailController extends GetxController {
  static OrderDetailController get to => Get.find();
  SharedPreferences sharedPreferences;

  String RegistrationId = '';
  final mRegistrationId = ''.obs;
  final OrderId = ''.obs;
  final OrderDetail = ''.obs;
  final OrderDate = '2021-02-01'.obs;
  final ExporeDate = ''.obs;
  final ProfileCount = ''.obs;
  final ViewedProfileCount = ''.obs;
  final PaidCost = ''.obs;
  final IsExpired = ''.obs;
  final BalViewCount = ''.obs;
  final PackageName = ''.obs;
  final PackageId = ''.obs;
  final RemDays = ''.obs;
  final OrderMsg = "".obs;
  RxBool IsAllowUnlock = false.obs;

  List users = [];

  //var basicList = List<OrderDetailModel>().obs;
  var isLoading = false.obs;
  //var UnlockProfile = List<UnlockProfileModel>().obs;
  //var UnlockProfile = List<MemberUnlockProfile>().obs;

  void onInit() async {
    sharedPreferences = await SharedPreferences.getInstance();
    super.onInit();
    mRegistrationId.value = sharedPreferences.getString("RegistrationId").toString();
    fetchBasicDetail(mRegistrationId.toString());
  }

  void fetchBasicDetail(String RegistrationId) async {
    isLoading.value = true;
    //final bDetail = await OrderDetailService.fetchOrderDetail(RegistrationId);
    final bDetail =
        await OrderDetailService.fetchMembersOrderDetail(RegistrationId);
    if(bDetail != null){
      SetOrderId(bDetail['OrderId']);
      SetOrderDetail(bDetail['OrderDetailId']);
      SetPackageName(bDetail['PackageNameTitle_en']);
      SetProfileCount(bDetail['ProfileCount']);
      SetRemainDays(bDetail['RemDays'].toString());
      SetOrderDate(bDetail['OrderDate']);
      SetViewedProfileCount(bDetail['ViewedProfileCount'].toString());
      SetBalViewCount(bDetail['BalViewCount'].toString());
      OrderMsg.value = "";
      if (int.parse(bDetail['RemDays']) > 0 &&
          int.parse(bDetail['BalViewCount']) > 0) {
        SetIsAllowUnlock(true);
      } else {
        SetIsAllowUnlock(false);
      }
    }
    else{
      OrderMsg.value = 'Invalid Payment Detail - Contact Administrator';
    }
    isLoading.value = false;
  }

  void UnlockProfile(String sRegistrationId, String mRegistrationId,
      String mOrderId, String mOrderDetail) async {
    final bDetail = await OrderDetailService.UnlockMemberProfile(
        sRegistrationId, mRegistrationId, this.OrderId.toString(), this.OrderDetail.toString());
    //Get.back();
    update();
  }

  SetIsAllowUnlock(bool IsAllowUnlocks) {
    IsAllowUnlock(IsAllowUnlocks);
  }

  SetPackageName(String PackageNames) {
    PackageName(PackageNames);
  }

  SetOrderId(String OrderIds) {
    OrderId(OrderIds);
  }

  SetOrderDetail(String OrderDetails) {
    OrderDetail(OrderDetails);
  }

  SetProfileCount(String ProfileCounts) {
    ProfileCount(ProfileCounts);
  }

  SetRemainDays(String RemDayss) {
    RemDays(RemDayss);
  }

  SetOrderDate(String OrderDates) {
    OrderDate(OrderDates);
  }

  SetViewedProfileCount(String ViewedProfileCounts) {
    ViewedProfileCount(ViewedProfileCounts);
  }

  SetBalViewCount(String BalViewCounts) {
    BalViewCount(BalViewCounts);
  }

  void fetchUnlockedProfileList(String RegistrationId, int ProfileCount) async {
    //isLoading(true);
    var Profile = await UnlockProfileViewService.FetchUnlockedProfile(
        RegistrationId, ProfileCount);
    if (Profile != null) {
      //UnlockProfile.assignAll(Profile);
      //print(Profile);
      users.assignAll(Profile);
    }
    //isLoading(false);
  }

  /*Future<List<UnlockProfileModel>> fetchUnlockedProfileList(String RegistrationId, int ProfileCount) async {
    UnlockProfile = await UnlockProfileViewService.FetchUnlockedProfile(RegistrationId, ProfileCount);
  }*/
}
