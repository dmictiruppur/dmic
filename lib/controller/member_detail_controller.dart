import 'package:get/get.dart';
//import 'package:kannada_devangar/services/member_profile_service.dart';
//import 'package:kannada_devangar/services/unlock_projfile_service.dart';

class MemberDetailController extends GetxController {
  static MemberDetailController get to => Get.find();

  final RegistrationId = "".obs;
  final RegCode = ''.obs;
  final MemberName_en = ''.obs;
  final WeightInKgs = ''.obs;
  final AboutMySelf = ''.obs;
  final About_Family = ''.obs;
  final AadharCardNo = ''.obs;
  final RegMobileNo = ''.obs;
  final AlternateMobileNo = ''.obs;
  final WhatsAppNo = ''.obs;
  final mDob = ''.obs;
  final age = ''.obs;
  final TimeOfBirth = ''.obs;
  final EmailId = ''.obs;

  final ProfilePhotoImage = ''.obs;
  final FullSizePhoto = ''.obs;
  final AadharCardImage = ''.obs;

  final ProfileCreatedForId = ''.obs;
  final ProfileCreatedFor_en = ''.obs;

  final MotherToungId = ''.obs;
  final MotherToungTitle_en = ''.obs;

  final GenderId = ''.obs;
  final GenderTitle_en = ''.obs;

  final MaritalStatusId = ''.obs;
  final MaritalStatusTitle_en = ''.obs;

  final BodyTypeId = ''.obs;
  final BodyTypeTitle_en = ''.obs;

  final HeightId = ''.obs;
  final HeightTitle_en = ''.obs;

  final SpecialCaseId = ''.obs;
  final SpecialCaseTitle_en = ''.obs;

  final CountryId = ''.obs;
  final CountryName_en = ''.obs;

  final StateId = ''.obs;
  final StateName_en = ''.obs;

  final CityId = ''.obs;
  final CityName_en = ''.obs;

  final CitizenShipId = ''.obs;
  final CitizenShip_en = ''.obs;

  final ReligionId = ''.obs;
  final ReligionTitle_en = ''.obs;

  final CastTitle_en = ''.obs;
  final CastId = ''.obs;

  final IsSevaiDhosam = false.obs;
  final IsRaguKedhu = false.obs;
  final IsSuthaJadhagam = false.obs;

  final OrganizationName = ''.obs;
  final SalaryPerAnnumInRs = ''.obs;

  final EducationId = ''.obs;
  final EducationTitle_en = ''.obs;

  final ProfessionalId = ''.obs;
  final ProfessionalTitle_en = ''.obs;

  final GothramId = ''.obs;
  final GothramTitle_en = ''.obs;

  final KolamId = ''.obs;
  final KolamTitle_en = ''.obs;

  final RasiMoonId = ''.obs;
  final RasiMoonTitle_en = ''.obs;

  final StarProId = ''.obs;
  final StarProTitle_en = ''.obs;

  final FatherName_en = ''.obs;
  final FatherOccupationId = ''.obs;
  final fOccupationTitle_en = ''.obs;
  final FatherKolamId = ''.obs;
  final fKolamTitle_en = ''.obs;

  final MotherName_en = ''.obs;
  final MotherOccupationId = ''.obs;
  final mOccupationTitle_en = ''.obs;
  final MotherKolamId = ''.obs;
  final mKolamTitle_en = ''.obs;

  final BrotherCountId = ''.obs;
  final MarriedBrotherCountId = ''.obs;
  final SisterCountId = ''.obs;
  final MarriedSisterCountId = ''.obs;
  final BrotherSisterCountTitle = ''.obs;
  final mbc_CountTitle = ''.obs;
  final sc_CountTitle = ''.obs;
  final msc_CountTitle = ''.obs;

  final FamilyStatusId = ''.obs;
  final FamilyStatusTitle_en = ''.obs;
  final FamilyTypeId = ''.obs;
  final FamilyTypeTitle_en = ''.obs;

  final FamilyValueId = ''.obs;
  final FamilyValueTitle_ta = ''.obs;

  final EmployeeInId = ''.obs;
  final EmployeeInTitle_en = ''.obs;

  final BirthPlaceId = ''.obs;
  final BirthPlace = ''.obs;
  final WorkingCityId = ''.obs;
  final WorkCity = ''.obs;

  List users = [];
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    //fetchBasicDetail(RegistrationId.toString());
  }

  setRegistrationId(String RegistrationIds) {
    RegistrationId(RegistrationIds);
  }

  /*void fetchBasicDetail(String RegistrationId) async {
    final bDetail =
        await MemberProfileService.FetchMembersProfileData(RegistrationId);
    if (bDetail != '') {
      SetAboutMySelf(bDetail['AboutMySelf'].toString());
      SetProfileCreatedFor_en(bDetail['ProfileCreatedFor_en'].toString());
      SetRegCode(bDetail['RegCode']);
      SetMemberName_en(bDetail['MemberName_en'].toString());
      SetMotherToungId(bDetail['MotherToungId'.toString()]);
      SetGenderId(bDetail['GenderId'].toString());
      SetMaritalStatusId(bDetail['MaritalStatusId'].toString());
      SetBodyTypeId(bDetail['BodyTypeId'].toString());
      SetHeightId(bDetail['HeightId'].toString());
      SetWeightInKgs(bDetail['WeightInKgs'].toString());
      SetSpecialCaseId(bDetail['SpecialCaseId'].toString());
      SetCountryId(bDetail['CountryId'].toString());
      SetStateId(bDetail['StateId'].toString());
      SetCityId(bDetail['CityId'].toString());
      SetProfileCreatedForId(bDetail['ProfileCreatedForId']);
      SetAbout_Family(bDetail['About_Family'].toString());
      SetProfilePhotoImage(bDetail['ProfilePhotoImage'].toString());
      SetFullSizePhoto(bDetail['FullSizePhoto'].toString());
      SetAadharCardNo(bDetail['AadharCardNo'].toString());
      SetAadharCardImage(bDetail['AadharCardImage'].toString());
      SetMotherToungTitle_en(bDetail['MotherToungTitle_en'].toString());
      SetGenderTitle_en(bDetail['GenderTitle_en'].toString());
      SetMaritalStatusTitle_en(bDetail['MaritalStatusTitle_en'].toString());
      SetBodyTypeTitle_en(bDetail['BodyTypeTitle_en'].toString());
      SetHeightTitle_en(bDetail['HeightTitle_en'].toString());
      SetSpecialCaseTitle_en(bDetail['SpecialCaseTitle_en'].toString());
      SetCountryName_en(bDetail['CountryName_en'].toString());
      SetStateName_en(bDetail['StateName_en'].toString());
      SetCityName_en(bDetail['CityName_en'].toString());
      SetCitizenShip_en(bDetail['CitizenShip_en'].toString());
      SetRegMobileNo(bDetail['RegMobileNo'].toString());
      SetAlternateMobileNo(bDetail['AlternateMobileNo'].toString());
      Setage(bDetail['age'].toString());
      SetEmailId(bDetail['EmailId'].toString());
    } else {
      Get.snackbar("Error : ", "Problem in Fetching Profile Data");
    }
  }*/

  /*void fetchKolamDetail(String RegistrationId) async {
    final bDetail =
        await MemberProfileService.FetchMembersProfileData(RegistrationId);
    if (bDetail != '') {
      SetGothramTitle_en(bDetail['GothramTitle_en'].toString());
      SetRasiMoonTitle_en(bDetail['RasiMoonTitle_en'].toString());
      SetStarProTitle_en(bDetail['StarProTitle_en'].toString());
      SetBirthPlace(bDetail['BirthPlace'].toString());
      SetCastId(bDetail['CastId'].toString());
      SetGothramId(bDetail['GothramId'].toString());
      SetKolamId(bDetail['KolamId'].toString());
      SetRasiMoonId(bDetail['RasiMoonId'].toString());
      SetStarProId(bDetail['StarProId'].toString());
      SetBirthPlaceId(bDetail['BirthPlaceId'].toString());
      SetKolamTitle_en(bDetail['KolamTitle_en'].toString());
      //SetmDob(bDetail['mDob']);
      //SetTimeOfBirth(bDetail['TimeOfBirth'].toString());
    } else {
      Get.snackbar("Error : ", "Problem in Fetching Profile Data");
    }
  }*/

  /*void fetchProfessionalDetail(String RegistrationId) async {
    final bDetail =
        await MemberProfileService.FetchMembersProfileData(RegistrationId);
    if (bDetail != '') {
      SetEducationTitle_en(bDetail['EducationTitle_en'].toString());
      SetProfessionalTitle_en(bDetail['ProfessionalTitle_en'].toString());
      SetWorkingCityId(bDetail['WorkingCityId'].toString());
      SetEducationId(bDetail['EducationId'].toString());
      SetProfessionalId(bDetail['ProfessionalId'].toString());
      SetOrganizationName(bDetail['OrganizationName'].toString());
      SetSalaryPerAnnumInRs(bDetail['SalaryPerAnnumInRs'].toString());
      SetWorkCity(bDetail['WorkCity'].toString());
      SetEmployeeInId(bDetail['EmployeeInId'].toString());
      SetEmployeeInTitle_en(bDetail['EmployeeInTitle_en'].toString());
    } else {
      Get.snackbar("Error : ", "Problem in Fetching Profile Data");
    }
  }*/

  /*void fetchFamilyDetail(String RegistrationId) async {
    final bDetail =
        await MemberProfileService.FetchMembersProfileData(RegistrationId);
    if (bDetail != '') {
      SetFatherName_en(bDetail['FatherName_en'].toString());
      SetFatherOccupationId(bDetail['FatherOccupationId'].toString());
      SetFatherKolamId(bDetail['FatherKolamId'].toString());
      SetfOccupationTitle_en(bDetail['fOccupationTitle_en'].toString());
      SetfKolamTitle_en(bDetail['fKolamTitle_en'].toString());

      SetMotherName_en(bDetail['MotherName_en'].toString());
      SetMotherOccupationId(bDetail['MotherOccupationId'].toString());
      SetMotherKolamId(bDetail['MotherKolamId'].toString());
      SetmOccupationTitle_en(bDetail['mOccupationTitle_en'].toString());
      SetmKolamTitle_en(bDetail['mKolamTitle_en'].toString());

      SetFamilyStatusId(bDetail['FamilyStatusId'].toString());
      SetFamilyTypeId(bDetail['FamilyTypeId'].toString());
      SetFamilyValueId(bDetail['FamilyValueId'].toString());

      SetBrotherSisterCountTitle(bDetail['BrotherSisterCountTitle'].toString());
      Setmbc_CountTitle(bDetail['mbc_CountTitle'].toString());
      Setsc_CountTitle(bDetail['sc_CountTitle'].toString());
      Setmsc_CountTitle(bDetail['msc_CountTitle'].toString());
      SetFamilyStatusTitle_en(bDetail['FamilyStatusTitle_en'].toString());
      SetFamilyTypeTitle_en(bDetail['FamilyTypeTitle_en'].toString());
      SetFamilyValueTitle_ta(bDetail['FamilyValueTitle_ta'].toString());

      SetBrotherCountId(bDetail['BrotherCountId'].toString());
      SetMarriedBrotherCountId(bDetail['MarriedBrotherCountId'].toString());
      SetSisterCountId(bDetail['SisterCountId'].toString());
      SetMarriedSisterCountId(bDetail['MarriedSisterCountId'].toString());
    } else {
      Get.snackbar("Error : ", "Problem in Fetching Profile Data");
    }
  }*/

  /*SetIsSevaiDhosams(bool IsSevaiDhosams) {
    if (IsSevaiDhosams == true) {
      IsSevaiDhosam(true);
    } else {
      IsSevaiDhosam(false);
    }
    //IsSevaiDhosam(IsSevaiDhosams);
  }

  SetEmployeeInTitle_en(String EmployeeInTitle_ens) {
    EmployeeInTitle_en(EmployeeInTitle_ens);
  }

  SetEmployeeInId(String SetEmployeeInIds) {
    EmployeeInId(SetEmployeeInIds);
  }

  SetFatherOccupationId(String FatherOccupationIds) {
    FatherOccupationId(FatherOccupationIds);
  }

  SetCastId(String CastIds) {
    CastId(CastIds);
  }

  SetfOccupationTitle_en(String fOccupationTitle_ens) {
    fOccupationTitle_en(fOccupationTitle_ens);
  }

  SetFatherKolamId(String FatherKolamIds) {
    FatherKolamId(FatherKolamIds);
  }

  SetfKolamTitle_en(String fKolamTitle_ens) {
    fKolamTitle_en(fKolamTitle_ens);
  }

  SetMotherName_en(String MotherName_ens) {
    MotherName_en(MotherName_ens);
  }

  SetMotherOccupationId(String MotherOccupationIds) {
    MotherOccupationId(MotherOccupationIds);
  }

  SetmOccupationTitle_en(String mOccupationTitle_ens) {
    mOccupationTitle_en(mOccupationTitle_ens);
  }

  SetMotherKolamId(String MotherKolamIds) {
    MotherKolamId(MotherKolamIds);
  }

  SetmKolamTitle_en(String mKolamTitle_ens) {
    mKolamTitle_en(mKolamTitle_ens);
  }

  SetBrotherCountId(String BrotherCountIds) {
    BrotherCountId(BrotherCountIds);
  }

  SetMarriedBrotherCountId(String MarriedBrotherCountIds) {
    MarriedBrotherCountId(MarriedBrotherCountIds);
  }

  SetSisterCountId(String SisterCountIds) {
    SisterCountId(SisterCountIds);
  }

  SetMarriedSisterCountId(String MarriedSisterCountIds) {
    MarriedSisterCountId(MarriedSisterCountIds);
  }

  SetBrotherSisterCountTitle(String BrotherSisterCountTitles) {
    BrotherSisterCountTitle(BrotherSisterCountTitles);
  }

  Setmbc_CountTitle(String mbc_CountTitles) {
    mbc_CountTitle(mbc_CountTitles);
  }

  Setsc_CountTitle(String sc_CountTitles) {
    sc_CountTitle(sc_CountTitles);
  }

  Setmsc_CountTitle(String msc_CountTitles) {
    msc_CountTitle(msc_CountTitles);
  }

  SetFamilyStatusId(String FamilyStatusIds) {
    FamilyStatusId(FamilyStatusIds);
  }

  SetFamilyStatusTitle_en(String FamilyStatusTitle_ens) {
    FamilyStatusTitle_en(FamilyStatusTitle_ens);
  }

  SetFamilyTypeId(String FamilyTypeIds) {
    FamilyTypeId(FamilyTypeIds);
  }

  SetFamilyTypeTitle_en(String FamilyTypeTitle_ens) {
    FamilyTypeTitle_en(FamilyTypeTitle_ens);
  }

  SetFamilyValueId(String FamilyValueIds) {
    FamilyValueId(FamilyValueIds);
  }

  SetFamilyValueTitle_ta(String FamilyValueTitle_tas) {
    FamilyValueTitle_ta(FamilyValueTitle_tas);
  }

  SetBirthPlaceId(String BirthPlaceIds) {
    BirthPlaceId(BirthPlaceIds);
  }

  SetBirthPlace(String BirthPlaces) {
    BirthPlace(BirthPlaces);
  }

  SetWorkingCityId(String WorkingCityIds) {
    WorkingCityId(WorkingCityIds);
  }

  SetWorkCity(String WorkCitys) {
    WorkCity(WorkCitys);
  }

  SetIsRaguKedhu(bool IsRaguKedhus) {
    IsRaguKedhu(IsRaguKedhus);
  }

  SetIsSuthaJadhagam(bool IsSuthaJadhagams) {
    IsSuthaJadhagam(IsSuthaJadhagams);
  }

  SetEmailId(String EmailIds) {
    EmailId(EmailIds);
  }

  SetOrganizationName(String OrganizationNames) {
    OrganizationName(OrganizationNames);
  }

  SetSalaryPerAnnumInRs(String SalaryPerAnnumInRss) {
    SalaryPerAnnumInRs(SalaryPerAnnumInRss);
  }

  SetEducationId(String EducationIds) {
    EducationId(EducationIds);
  }

  SetEducationTitle_en(String EducationTitle_ens) {
    EducationTitle_en(EducationTitle_ens);
  }

  SetProfessionalId(String ProfessionalIds) {
    ProfessionalId(ProfessionalIds);
  }

  SetProfessionalTitle_en(String ProfessionalTitle_ens) {
    ProfessionalTitle_en(ProfessionalTitle_ens);
  }

  SetGothramId(String GothramIds) {
    GothramId(GothramIds);
  }

  SetGothramTitle_en(String GothramTitle_ens) {
    GothramTitle_en(GothramTitle_ens).toString();
  }

  SetKolamId(String KolamIds) {
    KolamId(KolamIds);
  }

  SetKolamTitle_en(String KolamTitle_ens) {
    KolamTitle_en(KolamTitle_ens);
  }

  SetRasiMoonId(String RasiMoonIds) {
    RasiMoonId(RasiMoonIds);
  }

  SetRasiMoonTitle_en(String RasiMoonTitle_ens) {
    RasiMoonTitle_en(RasiMoonTitle_ens);
  }

  SetStarProId(String StarProIds) {
    StarProId(StarProIds);
  }

  SetStarProTitle_en(String StarProTitle_ens) {
    StarProTitle_en(StarProTitle_ens);
  }

  SetFatherName_en(String FatherName_ens) {
    FatherName_en(FatherName_ens);
  }

  Setage(String ages) {
    age(ages);
  }*/

  SetmDob(String mDobs) {
    /*var formatter = new DateFormat('dd-MM-yyyy');
    formatDate(DateTime date) {
      if (date != null) {
        mDob(formatter.format(mDobs)).toString();
      } else {
        mDob('NA');
      }
    }*/
    mDob(mDobs).toString();
  }

  /*SetTimeOfBirth(String TimeOfBirths) {
    TimeOfBirth(TimeOfBirths);
  }

  SetAlternateMobileNo(String AlternateMobileNos) {
    AlternateMobileNo(AlternateMobileNos);
  }

  SetRegMobileNo(String RegMobileNos) {
    RegMobileNo(RegMobileNos);
  }

  SetCitizenShip_en(String CitizenShip_ens) {
    CitizenShip_en(CitizenShip_ens);
  }

  SetCityName_en(String CityName_ens) {
    CityName_en(CityName_ens);
  }

  SetStateName_en(String StateName_ens) {
    StateName_en(StateName_ens);
  }

  SetCountryName_en(String CountryName_ens) {
    CountryName_en(CountryName_ens);
  }

  SetSpecialCaseTitle_en(String SpecialCaseTitle_ens) {
    SpecialCaseTitle_en(SpecialCaseTitle_ens);
  }

  SetHeightTitle_en(String HeightTitle_ens) {
    HeightTitle_en(HeightTitle_ens);
  }

  SetBodyTypeTitle_en(String BodyTypeTitle_ens) {
    BodyTypeTitle_en(BodyTypeTitle_ens);
  }

  SetMaritalStatusTitle_en(String MaritalStatusTitle_ens) {
    MaritalStatusTitle_en(MaritalStatusTitle_ens);
  }

  SetGenderTitle_en(String GenderTitle_ens) {
    GenderTitle_en(GenderTitle_ens);
  }

  SetMotherToungTitle_en(String MotherToungTitle_ens) {
    MotherToungTitle_en(MotherToungTitle_ens);
  }

  SetProfileCreatedFor_en(String ProfileCreatedFor_ens) {
    ProfileCreatedFor_en(ProfileCreatedFor_ens);
  }

  SetAadharCardImage(String AadharCardImages) {
    AadharCardImage(AadharCardImages);
  }

  SetAadharCardNo(String AadharCardNos) {
    AadharCardNo(AadharCardNos);
  }

  SetProfilePhotoImage(String ProfilePhotoImages) {
    ProfilePhotoImage(ProfilePhotoImages);
  }

  SetFullSizePhoto(String FullSizePhotos) {
    FullSizePhoto(FullSizePhotos);
  }

  SetAbout_Family(String About_Familys) {
    About_Family(About_Familys);
  }

  SetAboutMySelf(String AboutMySelfs) {
    AboutMySelf(AboutMySelfs);
  }

  SetCityId(String CityIds) {
    CityId(CityIds);
  }

  SetStateId(String StateIds) {
    StateId(StateIds);
  }

  SetCountryId(String CountryIds) {
    CountryId(CountryIds);
  }

  SetSpecialCaseId(String SpecialCaseIds) {
    SpecialCaseId(SpecialCaseIds);
  }

  SetWeightInKgs(String WeightInKgss) {
    WeightInKgs(WeightInKgss);
  }

  SetHeightId(String HeightIds) {
    HeightId(HeightIds);
  }

  SetBodyTypeId(String BodyTypeIds) {
    BodyTypeId(BodyTypeIds);
  }

  SetRegCode(String RegCodes) {
    RegCode(RegCodes);
  }

  SetProfileCreatedForId(String ProfileCreatedForIds) {
    ProfileCreatedForId(ProfileCreatedForIds);
  }

  SetMemberName_en(String MemberName_ens) {
    MemberName_en(MemberName_ens);
  }

  SetMotherToungId(String MotherToungIds) {
    MotherToungId(MotherToungIds);
  }

  SetGenderId(String GenderIds) {
    GenderId(GenderIds);
  }

  SetMaritalStatusId(String MaritalStatusIds) {
    MaritalStatusId(MaritalStatusIds);
  }*/

  /*void fetchUnlockedProfileList(String RegistrationId, int ProfileCount) async {
    //isLoading(true);
    var Profile = await UnlockProfileViewService.FetchUnlockedProfile(
        RegistrationId, ProfileCount);
    if (Profile != null) {
      //UnlockProfile.assignAll(Profile);
      //print(Profile);
      users.assignAll(Profile);
    }
    //isLoading(false);
  }*/
}
