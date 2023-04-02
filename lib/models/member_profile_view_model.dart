// To parse this JSON data, do
//
//     final memberProfileViewModel = memberProfileViewModelFromJson(jsonString);

import 'dart:convert';

MemberProfileViewModel memberProfileViewModelFromJson(String str) => MemberProfileViewModel.fromJson(json.decode(str));

String memberProfileViewModelToJson(MemberProfileViewModel data) => json.encode(data.toJson());

class MemberProfileViewModel {
  MemberProfileViewModel({
    this.regCode,
    this.oldRegCode,
    this.profileCreatedForId,
    this.memberNameEn,
    this.mPassword,
    this.weightInKgs,
    this.aboutMySelf,
    this.aboutFamily,
    this.profilePhotoImage,
    this.fullSizePhoto,
    this.aadharCardNo,
    this.aadharCardImage,
    this.profileCreatedForEn,
    this.motherToungTitleTa,
    this.genderTitleEn,
    this.maritalStatusTitleEn,
    this.bodyTypeTitleEn,
    this.heightTitleEn,
    this.specialCaseTitleEn,
    this.countryNameEn,
    this.stateNameEn,
    this.cityNameEn,
    this.citizenShipEn,
    this.religionTitleEn,
    this.castTitleEn,
    this.regMobileNo,
    this.alternateMobileNo,
    this.whatsAppNo,
    this.educationTitleEn,
    this.professionalTitleEn,
    this.mDob,
    this.age,
    this.horoscopeDetail,
    this.timeOfBirth,
    this.successStory,
    this.emailId,
    this.isSevaiDhosam,
    this.isRaguKedhu,
    this.isSuthaJadhagam,
    this.organizationName,
    this.salaryPerAnnumInRs,
    this.fatherNameEn,
    this.motherNameEn,
    this.brotherCountId,
    this.gothramTitleEn,
    this.rasiMoonTitleEn,
    this.starProTitleEn,
    this.birthPlace,
    this.workCity,
    this.fOccupationTitle_en,
    this.fKolamTitle_en,
    this.mOccupationTitle_en,
    this.mKolamTitle_en,
    this.BrotherSisterCountTitle,
    this.mbc_CountTitle,
    this.sc_CountTitle,
    this.msc_CountTitle,
    this.FamilyStatusTitle_en,
    this.FamilyTypeTitle_en,
    this.FamilyValueTitle_ta,
    this.KolamTitle_en,
    this.EmployeeInTitle_en,
  });

  String regCode;
  dynamic oldRegCode;
  String profileCreatedForId;
  String memberNameEn;
  String mPassword;
  String weightInKgs;
  String aboutMySelf;
  dynamic aboutFamily;
  String profilePhotoImage;
  String fullSizePhoto;
  String aadharCardNo;
  String aadharCardImage;
  String profileCreatedForEn;
  String motherToungTitleTa;
  String genderTitleEn;
  String maritalStatusTitleEn;
  String bodyTypeTitleEn;
  String heightTitleEn;
  String specialCaseTitleEn;
  String countryNameEn;
  String stateNameEn;
  String cityNameEn;
  String citizenShipEn;
  dynamic religionTitleEn;
  dynamic castTitleEn;
  String regMobileNo;
  String alternateMobileNo;
  String whatsAppNo;
  String educationTitleEn;
  String professionalTitleEn;
  DateTime mDob;
  String age;
  String horoscopeDetail;
  String timeOfBirth;
  dynamic successStory;
  String emailId;
  String isSevaiDhosam;
  String isRaguKedhu;
  String isSuthaJadhagam;
  String organizationName;
  String salaryPerAnnumInRs;
  String fatherNameEn;
  String motherNameEn;
  String brotherCountId;
  String gothramTitleEn;
  String rasiMoonTitleEn;
  String starProTitleEn;
  String birthPlace;
  String workCity;
  String fOccupationTitle_en;
  String fKolamTitle_en;
  String mOccupationTitle_en;
  String mKolamTitle_en;
  String BrotherSisterCountTitle;
  String mbc_CountTitle;
  String sc_CountTitle;
  String msc_CountTitle;
  String FamilyStatusTitle_en;
  String FamilyTypeTitle_en;
  String FamilyValueTitle_ta;
  String KolamTitle_en;
  String EmployeeInTitle_en;

  factory MemberProfileViewModel.fromJson(Map<String, dynamic> json) => MemberProfileViewModel(
    regCode: json["RegCode"],
    oldRegCode: json["OldRegCode"],
    profileCreatedForId: json["ProfileCreatedForId"],
    memberNameEn: json["MemberName_en"],
    mPassword: json["mPassword"],
    weightInKgs: json["WeightInKgs"],
    aboutMySelf: json["AboutMySelf"],
    aboutFamily: json["About_Family"],
    profilePhotoImage: json["ProfilePhotoImage"],
    fullSizePhoto: json["FullSizePhoto"],
    aadharCardNo: json["AadharCardNo"],
    aadharCardImage: json["AadharCardImage"],
    profileCreatedForEn: json["ProfileCreatedFor_en"],
    motherToungTitleTa: json["MotherToungTitle_ta"],
    genderTitleEn: json["GenderTitle_en"],
    maritalStatusTitleEn: json["MaritalStatusTitle_en"],
    bodyTypeTitleEn: json["BodyTypeTitle_en"],
    heightTitleEn: json["HeightTitle_en"],
    specialCaseTitleEn: json["SpecialCaseTitle_en"],
    countryNameEn: json["CountryName_en"],
    stateNameEn: json["StateName_en"],
    cityNameEn: json["CityName_en"],
    citizenShipEn: json["CitizenShip_en"],
    religionTitleEn: json["ReligionTitle_en"],
    castTitleEn: json["CastTitle_en"],
    regMobileNo: json["RegMobileNo"],
    alternateMobileNo: json["AlternateMobileNo"],
    whatsAppNo: json["WhatsAppNo"],
    educationTitleEn: json["EducationTitle_en"],
    professionalTitleEn: json["ProfessionalTitle_en"],
    mDob: DateTime.parse(json["mDob"]),
    age: json["age"],
    horoscopeDetail: json["Horoscope_Detail"],
    timeOfBirth: json["TimeOfBirth"],
    successStory: json["SuccessStory"],
    emailId: json["EmailId"],
    isSevaiDhosam: json["IsSevaiDhosam"],
    isRaguKedhu: json["IsRaguKedhu"],
    isSuthaJadhagam: json["IsSuthaJadhagam"],
    organizationName: json["OrganizationName"],
    salaryPerAnnumInRs: json["SalaryPerAnnumInRs"],
    fatherNameEn: json["FatherName_en"],
    motherNameEn: json["MotherName_en"],
    brotherCountId: json["BrotherCountId"],
    gothramTitleEn: json["GothramTitle_en"],
    rasiMoonTitleEn: json["RasiMoonTitle_en"],
    starProTitleEn: json["StarProTitle_en"],
    birthPlace: json["BirthPlace"],
    workCity: json["WorkCity"],
    fOccupationTitle_en: json["fOccupationTitle_en"],
    fKolamTitle_en: json["fKolamTitle_en"],
    mOccupationTitle_en: json["mOccupationTitle_en"],
    mKolamTitle_en: json["mKolamTitle_en"],
    BrotherSisterCountTitle: json["BrotherSisterCountTitle"],
    mbc_CountTitle: json["mbc_CountTitle"],
    sc_CountTitle: json["sc_CountTitle"],
    msc_CountTitle: json["msc_CountTitle"],
    FamilyStatusTitle_en: json["FamilyStatusTitle_en"],
    FamilyTypeTitle_en: json["FamilyTypeTitle_en"],
    FamilyValueTitle_ta: json["FamilyValueTitle_ta"],
    KolamTitle_en: json["KolamTitle_en"],
    EmployeeInTitle_en: json["EmployeeInTitle_en"],
  );

  Map<String, dynamic> toJson() => {
    "RegCode": regCode,
    "OldRegCode": oldRegCode,
    "ProfileCreatedForId": profileCreatedForId,
    "MemberName_en": memberNameEn,
    "mPassword": mPassword,
    "WeightInKgs": weightInKgs,
    "AboutMySelf": aboutMySelf,
    "About_Family": aboutFamily,
    "ProfilePhotoImage": profilePhotoImage,
    "FullSizePhoto": fullSizePhoto,
    "AadharCardNo": aadharCardNo,
    "AadharCardImage": aadharCardImage,
    "ProfileCreatedFor_en": profileCreatedForEn,
    "MotherToungTitle_ta": motherToungTitleTa,
    "GenderTitle_en": genderTitleEn,
    "MaritalStatusTitle_en": maritalStatusTitleEn,
    "BodyTypeTitle_en": bodyTypeTitleEn,
    "HeightTitle_en": heightTitleEn,
    "SpecialCaseTitle_en": specialCaseTitleEn,
    "CountryName_en": countryNameEn,
    "StateName_en": stateNameEn,
    "CityName_en": cityNameEn,
    "CitizenShip_en": citizenShipEn,
    "ReligionTitle_en": religionTitleEn,
    "CastTitle_en": castTitleEn,
    "RegMobileNo": regMobileNo,
    "AlternateMobileNo": alternateMobileNo,
    "WhatsAppNo": whatsAppNo,
    "EducationTitle_en": educationTitleEn,
    "ProfessionalTitle_en": professionalTitleEn,
    "mDob": "${mDob.year.toString().padLeft(4, '0')}-${mDob.month.toString().padLeft(2, '0')}-${mDob.day.toString().padLeft(2, '0')}",
    "age": age,
    "Horoscope_Detail": horoscopeDetail,
    "TimeOfBirth": timeOfBirth,
    "SuccessStory": successStory,
    "EmailId": emailId,
    "IsSevaiDhosam": isSevaiDhosam,
    "IsRaguKedhu": isRaguKedhu,
    "IsSuthaJadhagam": isSuthaJadhagam,
    "OrganizationName": organizationName,
    "SalaryPerAnnumInRs": salaryPerAnnumInRs,
    "FatherName_en": fatherNameEn,
    "MotherName_en": motherNameEn,
    "BrotherCountId": brotherCountId,
    "GothramTitle_en": gothramTitleEn,
    "RasiMoonTitle_en": rasiMoonTitleEn,
    "StarProTitle_en": starProTitleEn,
    "BirthPlace": birthPlace,
    "WorkCity": workCity,
    "fOccupationTitle_en": fOccupationTitle_en,
    "fKolamTitle_en": fKolamTitle_en,
    "mOccupationTitle_en": mOccupationTitle_en,
    "mKolamTitle_en": mKolamTitle_en,
    "BrotherSisterCountTitle": BrotherSisterCountTitle,
    "mbc_CountTitle": mbc_CountTitle,
    "sc_CountTitle": sc_CountTitle,
    "msc_CountTitle": msc_CountTitle,
    "FamilyStatusTitle_en": FamilyStatusTitle_en,
    "FamilyTypeTitle_en": FamilyTypeTitle_en,
    "FamilyValueTitle_ta": FamilyValueTitle_ta,
    "KolamTitle_en": KolamTitle_en,
    "EmployeeInTitle_en": EmployeeInTitle_en,
  };
}