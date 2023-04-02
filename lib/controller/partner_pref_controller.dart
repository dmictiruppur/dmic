import 'package:get/get.dart';

class Partner_Pref_Controller extends GetxController {
  RxString AgeFrom = '20'.obs;
  RxString AgeTo = '40'.obs;
  RxBool IsSevaiDhosam = false.obs;
  RxBool IsSuthaJadhagam = false.obs;
  RxBool IsRaaguKedhu = false.obs;
  RxString sMaritalStatusId = "0".obs;
  RxString sKolamId = "0".obs;
  RxString sThavirkumKolamId = "0".obs;
  RxString sRaasiId = "0".obs;
  RxString sNatchathiramId = "0".obs;

  static Partner_Pref_Controller get to => Get.find<Partner_Pref_Controller>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  SetAgeFrom(String AgeFroms) {
    AgeFrom(AgeFroms);
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
