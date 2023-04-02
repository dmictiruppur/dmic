import 'package:get/get.dart';
import 'package:kannada_devangar/controller/search_controller.dart';
import 'package:kannada_devangar/models/SearchMembersListModel.dart';
import 'package:kannada_devangar/repositories/search_detail_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchDetailController extends GetxController {
  SearchDetailController({this.search_controller});
  SharedPreferences sharedPreferences;

  Search_Controller search_controller;

  final SearchMembersList = List<SearchMembersListModel>().obs;
  /*get postList => this.SearchMembersList.value;
  set postList(value) => this.SearchMembersList.value = value;*/
  var isLoading = true.obs;

  RxString AgeFrom = '20'.obs;
  RxString RegistrationId = "".obs;
  RxString AgeTo = '40'.obs;
  RxBool IsSevaiDhosam = false.obs;
  RxBool IsSuthaJadhagam = false.obs;
  RxBool IsRaaguKedhu = false.obs;
  RxString sMaritalStatusId = "0".obs;
  RxString sKolamId = "0".obs;
  RxString sGothiramId = "0".obs;
  RxString sThavirkumKolamId = "0".obs;
  RxString sRaasiId = "0".obs;
  RxString sNatchathiramId = "0".obs;
  RxString sRegistrationId = "".obs;
  RxString mProfileViewId = "".obs;

  static SearchDetailController get to => Get.find<SearchDetailController>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    FetchSearchDetailList();
  }

  void FetchSearchDetailList() async {
    /*Future.delayed(
        Duration(seconds: 5),
            () => Get.dialog(Expanded(child: Center(child: CircularProgressIndicator())),
            barrierDismissible: false));*/
    try {
      sharedPreferences = await SharedPreferences.getInstance();
      //RegistrationId = sharedPreferences.getString("RegistrationId").toString();
      SetRegistrationId(sharedPreferences.getString("RegistrationId").toString());
      var todos = await SearchDetailRepository.getTodo(
          RegistrationId.toString(), search_controller?.AgeFrom.toString(),
          search_controller?.AgeTo.toString(), search_controller?.sMaritalStatusId.toString(), search_controller?.sKolamId.toString(),
          search_controller?.sGothiramId.toString(), search_controller?.sRaasiId.toString(), search_controller?.sNatchathiramId.toString(),
          search_controller?.IsSevaiDhosam.toString(), search_controller?.IsRaaguKedhu.toString(), search_controller?.IsSuthaJadhagam.toString(), search_controller?.RegCode.toString()
      );
      if (todos != null) {
        isLoading(false);
        SearchMembersList.value = todos;
      }
      else{
        Get.snackbar("Error", "Problem in Getting Data....");
        isLoading(false);
      }
    } finally {
      isLoading(false);
      //Get.back();
    }
  }

SetRegistrationId(String RegistrationIds) {
  RegistrationId(RegistrationIds);
}

SetAgeFrom(String AgeFroms) {
  AgeFrom(AgeFroms);
}

SetmProfileViewId(String mProfileViewIds) {
  mProfileViewId(mProfileViewIds);
}

SetsRegistrationId(String sRegistrationIds) {
  sRegistrationId(sRegistrationIds);
}

SetAgeTo(String AgeTos) {
  AgeTo(AgeTos);
}

SetIsSevaiDhosam(bool Issds) {
  IsSevaiDhosam(Issds);
}

SetIsSuthaJadhagam(bool IsSj) {
  IsSuthaJadhagam(IsSj);
}

SetIsRaaguKedhu(bool IsSj) {
  IsRaaguKedhu(IsSj);
}

SetsKolamId(String sKolamIds) {
  sKolamId(sKolamIds);
}

SetsThavirkumKolamId(String sThavirkumKolamIds) {
  sThavirkumKolamId(sThavirkumKolamIds);
}

SetsRaasiId(String sRaasiIds) {
  sRaasiId(sRaasiIds);
}

SetsNatchathiramId(String sNatchathiramIds) {
  sNatchathiramId(sNatchathiramIds);
}

SetsMaritalStatusId(String MaritalStatusId) {
  sMaritalStatusId(MaritalStatusId);
}
}