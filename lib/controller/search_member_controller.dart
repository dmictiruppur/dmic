import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kannada_devangar/controller/search_controller.dart';
import 'package:kannada_devangar/core/urls.dart';
import 'package:kannada_devangar/models/SearchMembersListModel.dart';
import 'package:dio/dio.dart';
import 'package:kannada_devangar/models/member_order_detail_model.dart';
import 'package:kannada_devangar/models/single_member_detail_model.dart';
import 'package:kannada_devangar/services/member_search_provider.dart';
import 'package:kannada_devangar/views/members_detail_screen.dart';
import 'package:kannada_devangar/views/search_detail_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Search_Member_Controller extends GetxController {
  SharedPreferences sharedPreferences;
  RxString AgeFrom = '20'.obs;
  RxString AgeTo = '40'.obs;
  RxBool IsSevaiDhosam = false.obs;
  RxString SevaiDhosam = "0".obs;
  RxBool IsSuthaJadhagam = false.obs;
  RxString SuthaJadhagam = "0".obs;
  RxBool IsRaaguKedhu = false.obs;
  RxString RaaguKedhu = "0".obs;
  RxString sMaritalStatusId = "0".obs;
  RxString sKolamId = "0".obs;
  RxString sGothiramId = "0".obs;
  RxString sThavirkumKolamId = "0".obs;
  RxString sRaasiId = "0".obs;
  RxString sNatchathiramId = "0".obs;
  RxString sRegCode = "".obs;
  RxString RegistrationId = "".obs;
  RxString RegCode = "".obs;
  RxString mProfileViewId = "".obs;
  RxString ProfilePhotoImage = "".obs;

  RxString sRegistrationId = "".obs;

  RxString OrderId = "".obs;
  RxString OrderDetailId = "".obs;
  RxString OrderDate = "".obs;
  RxString ExpireDate = "".obs;
  RxString OrderTime = "".obs;
  RxString ProfileCount = "".obs;
  RxString ViewedProfileCount = "".obs;
  RxString PaidCost = "".obs;
  RxString IsExpired = "".obs;
  RxString BalViewCount = "".obs;
  RxString PackageNameTitle_en = "".obs;
  RxString PackageId = "".obs;
  RxString RemDays = "".obs;

  final postsList = List<SearchMembersListModel>().obs;
  final orderlist = List<MemberOrderDetailModel>().obs;
  final smdetail_list = List<SingleMemberDetailModel>().obs;
  //MemberOrderDetailModel OrderDetail;
  SingleMemberDetailModel smdetail_list_new;

  /*get postList => this._postsList.value;
  set postList(value) => this._postsList.value = value;*/
  var isLoading = true.obs;
  var isSearchLoading = true.obs;
  RxBool IsProfileUnlocked = false.obs;

  static Search_Member_Controller get to =>
      Get.find<Search_Member_Controller>();

  static Dio dio = new Dio();
  //final baseUrl = URLs.search_members;
  //final unlock_profile = URLs.unlock_profile;

  @override
  void onInit() async {
    // TODO: implement onInit
    sharedPreferences = await SharedPreferences.getInstance();
    SetRegistrationId(sharedPreferences.getString("RegistrationId").toString());
    fetchfinaltodo();
    //fetch_Orderdetail(RegistrationId.toString());
    //fetch_Orderdetail_new(RegistrationId.toString());
    super.onInit();
  }

  SetRegistrationId(String RegistrationIds) {
    RegistrationId(RegistrationIds);
  }

  SetAgeFrom(String AgeFroms) {
    AgeFrom(AgeFroms);
  }

  SetAgeTo(String AgeTos) {
    AgeTo(AgeTos);
  }

  SetIsSevaiDhosam(bool IsSevaiDhosams) {
    //print("Search Controller = " + IsSevaiDhosam.toString());
    IsSevaiDhosam(IsSevaiDhosams);
    if (IsSevaiDhosams == false) {
      SevaiDhosam.value = "0".toString();
    } else {
      SevaiDhosam.value = "1".toString();
    }
  }

  SetIsRaaguKedhu(bool IsRaaguKedhus) {
    IsRaaguKedhu(IsRaaguKedhus);
    if (IsRaaguKedhus == false) {
      RaaguKedhu.value = "0".toString();
    } else {
      RaaguKedhu.value = "1".toString();
    }
  }

  SetIsSuthaJadhagam(bool IsSuthaJadhagams) {
    IsSuthaJadhagam(IsSuthaJadhagams);
    if (IsSuthaJadhagams == false) {
      SuthaJadhagam.value = "0".toString();
    } else {
      SuthaJadhagam.value = "1".toString();
    }
  }

  SetsKolamId(String sKolamIds) {
    sKolamId(sKolamIds);
  }

  SetsRaasiId(String sRaasiIds) {
    sRaasiId(sRaasiIds);
  }

  SetsNatchathiramId(String sNatchathiramIds) {
    sNatchathiramId(sNatchathiramIds);
  }

  SetsThavirkumKolamId(String sThavirkumKolamIds) {
    sThavirkumKolamId(sThavirkumKolamIds);
  }

  SetsMaritalStatusId(String sMaritalStatusIds) {
    sMaritalStatusId(sMaritalStatusIds);
  }

  SetsGothiramId(String sGothiramIds) {
    sGothiramId(sGothiramIds);
  }

  SetmProfileViewId(String mProfileViewIds) {
    mProfileViewId(mProfileViewIds);
  }

  SetIsProfileUnlocked(bool IsProfileUnlockeds) {
    IsProfileUnlocked(IsProfileUnlockeds);
  }

  SetsRegistrationId(String sRegistrationIds) {
    sRegistrationId(sRegistrationIds);
  }

  SetmRegistrationId(String mRegistrationIds) {
    RegistrationId(mRegistrationIds);
  }

  SetOrderId(String OrderIds) {
    OrderId(OrderIds);
  }

  SetOrderDetailId(String OrderDetailIds) {
    OrderDetailId(OrderDetailIds);
  }

  SetOrderDate(String OrderDates) {
    OrderDate(OrderDates);
  }

  SetExpireDate(String ExpireDates) {
    ExpireDate(ExpireDates);
  }

  SetOrderTime(String OrderTimes) {
    OrderTime(OrderTimes);
  }

  SetProfileCount(String ProfileCounts) {
    ProfileCount(ProfileCounts);
  }

  SetViewedProfileCount(String ViewedProfileCounts) {
    ViewedProfileCount(ViewedProfileCounts);
  }

  SetPaidCost(String PaidCosts) {
    PaidCost(PaidCosts);
  }

  SetIsExpired(String IsExpireds) {
    IsExpired(IsExpireds);
  }

  SetBalViewCount(String BalViewCounts) {
    BalViewCount(BalViewCounts);
  }

  SetPackageNameTitle_en(String PackageNameTitle_ens) {
    PackageNameTitle_en(PackageNameTitle_ens);
  }

  SetPackageId(String PackageIds) {
    PackageId(PackageIds);
  }

  SetsRegCode(String sRegCodes) {
    sRegCode(sRegCodes);
  }

  SetRemDays(String RemDayss) {
    RemDays(RemDayss);
  }

  void fetchfinaltodo() async {
    isLoading(true);
    try {
      var todos = await MyApiClient.getTodo(
          RegistrationId.toString(),
          AgeFrom.toString(),
          AgeTo.toString(),
          sMaritalStatusId.toString(),
          sKolamId.toString(),
          sGothiramId.toString(),
          sRaasiId.toString(),
          sNatchathiramId.toString(),
          SevaiDhosam.toString(),
          RaaguKedhu.toString(),
          SuthaJadhagam.toString(),
          sRegCode.toString());
      //print("Fetch Detail");
      if (todos != null) {
        postsList.value = todos;
      }
    } finally {
      isLoading(false);
    }
  }

  void fetch_Orderdetail(String RegistrationId) async {
    isLoading(true);
    try {
      var todos1 = await MyApiClient.GetOrderDetail(RegistrationId.toString());
      print("Fetch Order Detail");
      if (todos1 != null) {
        orderlist.value = todos1;
      }
    } finally {
      isLoading(false);
    }
  }

  AssignValueToObs(
      String AgeFrom,
      String AgeTo,
      String sMaritalStatusId,
      String sKolamId,
      String sGothiramId,
      String sRaasiId,
      String sNatchathiramId,
      String sThavirkumKolamId,
      bool IsSevaiDhosam,
      bool IsRaaguKedhu,
      bool IsSuthaJadhagam,
      String sRegCode) async {
    SetAgeFrom(AgeFrom);
    SetAgeTo(AgeTo);
    SetsMaritalStatusId(sMaritalStatusId);
    SetsKolamId(sKolamId);
    SetsGothiramId(sGothiramId);
    SetsThavirkumKolamId(sThavirkumKolamId);
    SetsRaasiId(sRaasiId);
    SetsNatchathiramId(sNatchathiramId);
    SetIsSevaiDhosam(IsSevaiDhosam);
    SetIsSuthaJadhagam(IsSuthaJadhagam);
    SetIsRaaguKedhu(IsRaaguKedhu);
    SetsRegCode(sRegCode);
    //Get.dialog(Center(child: Center(child: CircularProgressIndicator()),),barrierDismissible: false,);
    postsList.clear();

    fetchfinaltodo();
    fetch_Orderdetail_new(RegistrationId.toString());
    isSearchLoading.value = false;
    final result = await Get.to<String>(
        SearchDetailScreen(
          AgeFrom: AgeFrom.toString(),
          AgeTo: AgeTo.toString(),
          sMaritalStatusId: sMaritalStatusId.toString(),
          sKolamId: sKolamId.toString(),
          sGothiramId: sGothiramId.toString(),
          sThavirkumKolamId: sThavirkumKolamId.toString(),
          sRaasiId: sRaasiId.toString(),
          sNatchathiramId: sNatchathiramId.toString(),
          IsSevaiDhosam: SevaiDhosam.value,
          IsSuthaJadhagam: SuthaJadhagam.value,
          IsRaaguKedhu: RaaguKedhu.value,
          sRegCode: sRegCode.toString(),
        ),
        arguments: smdetail_list_new);
  }

  fetch_single_member_detail(String RegistrationId, String sRegistrationId,
      String OrderId, String OrderDetail) async {
    smdetail_list.clear();
    isLoading(true);
    try {
      /*Future.delayed(
          Duration(seconds: 5),
              () => Get.dialog(Expanded(child: Center(child: CircularProgressIndicator())),
              barrierDismissible: false));*/
      //print(RegistrationId + " - " + sRegistrationId);
      var todos1 = await MyApiClient.FetchSingleMembersProfile(
          RegistrationId.toString(), sRegistrationId.toString());
      smdetail_list.assign(todos1);
      isLoading(false);
      update();
      //return smdetail_list_new;
      final result = await Get.to<String>(MemberDetailScreen(
          sRegistrationId: sRegistrationId.toString(),
          mRegistrationId: RegistrationId.toString(),
          mOrderId: OrderId.toString(),
          mOrderDetailId: OrderDetail.toString()));
    } finally {
      isLoading(false);
    }
  }

  /*Future<List<SearchMembersListModel>> GetAll() async {
    final body = {
      'MemberId': '4241',
      'AgeFrom': '18',
      'AgeTo': '50',
      'maritualstatus': '3',
      'kolam': '0',
      'gothram': '0',
      'raasimoon': '0',
      'starpro': '0',
      'sevadhosam': '0',
      'raadukedhu': '0',
      'suthajaadhagam': '0',
      'RegCode': null
    };
    var response = await dio.post(baseUrl,
        data: body, options: Options(headers: _setHeaders()));

    if (response.statusCode == 200) {
      List jsonResponse = response.data;
      return jsonResponse.map((job) => new SearchMembersListModel.fromJson(job))
          .toList();
      //postsList.addAll(response.data);
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }*/

  Future fetch_Orderdetail_new(String RegistrationId) async {
    isLoading(true);
    try {
      var data = await MyApiClient.GetOrderDetail_New_WithoutModel(
          RegistrationId.toString());
      //print(data);
      //print(data['OrderDetailId']);
      SetOrderId(data['OrderId'].toString());
      SetOrderDetailId(data['OrderDetailId'].toString());
      SetOrderDate(data['OrderDate'].toString());
      SetExpireDate(data['ExpireDate'].toString());
      SetOrderTime(data['OrderTime'].toString());
      SetProfileCount(data['ProfileCount'].toString());
      SetViewedProfileCount(data['ViewedProfileCount'].toString());
      SetPaidCost(data['PaidCost'].toString());
      SetIsExpired(data['IsExpired'].toString());
      SetBalViewCount(data['BalViewCount'].toString());
      SetPackageNameTitle_en(data['PackageNameTitle_en'].toString());
      SetPackageId(data['PackageId'].toString());
      SetRemDays(data['RemDays'].toString());
      //OrderDetail.registerationId=data['RegisterationId'];
      //print("Fetch Order Detail");
      /*if (todos1 != null) {
          orderlist.value = todos1;
        }*/
    } finally {
      isLoading(false);
    }
  }

  UnlockProfile(String RegistrationId, String sRegistrationId, String OrderId,
      String OrderDetailId, String mProfileViewId) async {
    try {
      int ViewId = int.parse(mProfileViewId);
      if (ViewId == 0) {
        final body = {
          'MemberId': RegistrationId.toString(),
          'sRegistrationId': sRegistrationId.toString(),
          'OrderId': OrderId.toString(),
          'OrderDetailId': OrderDetailId.toString()
        };
        print(sRegistrationId.toString());
        var res1 = await dio.post(URLs.generate_pdf,
            data: body, options: Options(headers: _setHeaders()));
        var response = await dio.post(URLs.unlock_profile,
            data: body, options: Options(headers: _setHeaders()));
        print(response);
        if (response.statusCode == 200) {
          //Get.back();
          SetIsProfileUnlocked(true);
          Get.snackbar("Success", "Profile Unlocked Successfully....",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.greenAccent,
              colorText: Colors.white);
        } else {
          SetIsProfileUnlocked(false);
          Get.snackbar("Error", "Problem in Unlocked Profile....",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red,
              colorText: Colors.white);
        }
      } else {
        SetIsProfileUnlocked(true);
        Get.snackbar("Error", "You Already Unlocked this profile...",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.greenAccent,
            colorText: Colors.white);
      }
    } catch (e) {
      print(e.toString());
      SetIsProfileUnlocked(false);
      Get.snackbar("Error", e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    } finally {
      fetch_Orderdetail_new(RegistrationId.toString());
      fetch_single_member_detail(
          RegistrationId.toString(),
          sRegistrationId.toString(),
          OrderId.toString(),
          OrderDetailId.toString());
    }
  }
}

_setHeaders() => {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Access-Control_allow_orgin': '*',
    };
