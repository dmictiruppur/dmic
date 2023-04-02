import 'package:get/get.dart';
import 'package:kannada_devangar/core/urls.dart';
import 'package:kannada_devangar/models/SearchMembersListModel.dart';
import 'package:kannada_devangar/models/member_order_detail_model.dart';
import 'package:kannada_devangar/repositories/search_repository.dart';
import 'package:dio/dio.dart';

class Search_Controller extends GetxController {
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
  String RegistrationId = "";
  RxString RegCode = "".obs;
  RxString sRegistrationId = "".obs;
  RxString mProfileViewId = "".obs;
  RxString ProfilePhotoImage = "".obs;
  RxString sRegCode = "".obs;

  final _postsList = List<SearchMembersListModel>().obs;
  get postList => this._postsList.value;
  set postList(value) => this._postsList.value = value;

  /*final _orderList = List<MemberOrderDetailModel>().obs;
  get orderList => this._orderList.value;
  set orderList(value) => this._orderList.value = value;*/

  static Search_Controller get to => Get.find<Search_Controller>();

  static Dio dio = new Dio();
  //final baseUrl = URLs.search_members;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    //checkLoginStatus();
  }

  /*getAll() {
    MyRepository().getAll().then((data) {
      this.postList = data;
    });
    update();
  }*/

  /*searchMemberList() async {
    try {
      final body = {
        'MemberId': '4241',
        'AgeFrom': '18',
        'AgeTo': '50',
        'maritualstatus': '5',
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
        Iterable jsonRespone = response.data;
        List<SearchMembersListModel> listMyModel = jsonRespone
            .map((model) => SearchMembersListModel.fromJson(model))
            .toList();
        return listMyModel;
      } else {
        print('err');
      }
    } catch (e) {
      print(e.toString());
    }
  }*/

  /*getOrderDetail() {
    MyRepository().getOrderDetail().then((data) {
      this.orderList = data;
    });
    update();
  }*/

  SetAgeFrom(String AgeFroms) {
    AgeFrom(AgeFroms);
  }

  SetAgeTo(String AgeTos) {
    AgeTo(AgeTos);
  }

  SetIsSevaiDhosam(bool IsSevaiDhosams) {
    IsSevaiDhosam(IsSevaiDhosams);
    //print("Search Controller = " + IsSevaiDhosam.toString());
    if(IsSevaiDhosams == false){
      SevaiDhosam.value = "0".toString();
    }
    else{
      SevaiDhosam.value = "1".toString();
    }
  }

  SetIsRaaguKedhu(bool IsRaaguKedhus) {
    IsRaaguKedhu(IsRaaguKedhus);
    if(IsRaaguKedhus == false){
      RaaguKedhu.value = "0".toString();
    }
    else{
      RaaguKedhu.value = "1".toString();
    }
  }

  SetIsSuthaJadhagam(bool IsSuthaJadhagams) {
    IsSuthaJadhagam(IsSuthaJadhagams);
    if(IsSuthaJadhagams == false){
      SuthaJadhagam.value = "0".toString();
    }
    else{
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

  SetmProfileViewId(String mProfileViewIds) {
    mProfileViewId(mProfileViewIds);
  }

  SetsRegistrationId(String sRegistrationIds) {
    sRegistrationId(sRegistrationIds);
  }

  SetsRegCode(String sRegCodes){
  sRegCode(sRegCodes);
}
}

_setHeaders() => {
  'Content-type': 'application/json',
  'Accept': 'application/json',
  'Access-Control_allow_orgin': '*',
};