// To parse this JSON data, do
//
//     final singleMemberDetailModel = singleMemberDetailModelFromJson(jsonString);

import 'dart:convert';

SingleMemberDetailModel singleMemberDetailModelFromJson(String str) => SingleMemberDetailModel.fromJson(json.decode(str));

String singleMemberDetailModelToJson(SingleMemberDetailModel data) => json.encode(data.toJson());

class SingleMemberDetailModel {
  SingleMemberDetailModel({
    this.registrationId,
    this.regCode,
    this.memberNameEn,
    this.memberNameTa,
    this.weightInKgs,
    this.mDob,
    this.age,
    this.profileCreatedForEn,
    this.profileCreatedForTa,
    this.motherToungTitleEn,
    this.heightTitleEn,
    this.cityNameEn,
    this.stateNameEn,
    this.countryNameEn,
    this.educationTitleEn,
    this.professionalTitleEn,
    this.profilePhotoImage,
    this.gothramTitleEn,
    this.kolamTitleEn,
    this.rasiMoonTitleEn,
    this.starProTitleEn,
    this.mProfileViewId,
    this.timeOfBirth,
    this.birthPlace,
    this.specialCaseTitleEn,
    this.workCityName,
    this.fOccupationTitleEn,
    this.fKolamTitleEn,
    this.mOccupationTitleEn,
    this.mKolamTitleEn,
    this.brotherSisterCountTitle,
    this.mbcCountTitle,
    this.scCountTitle,
    this.mscCountTitle,
    this.familyStatusTitleEn,
    this.familyStatusTitleTa,
    this.familyTypeTitleEn,
    this.familyValueTitleTa,
    this.employeeInTitleEn,
    this.maritalStatusTitleEn,
    this.sevaiDhosam,
    this.raguKedhu,
    this.suthaJadhagam,
    this.fatherNameEn,
    this.motherNameEn,
    this.regMobileNo,
    this.alternateMobileNo,
    this.salaryPerAnnumInRs,
    this.organizationName,
    this.horoscopeDetail,
    this.AboutMySelf,
    this.About_Family,
  });

  String registrationId;
  String regCode;
  String memberNameEn;
  String memberNameTa;
  String weightInKgs;
  DateTime mDob;
  String age;
  String profileCreatedForEn;
  String profileCreatedForTa;
  dynamic motherToungTitleEn;
  String heightTitleEn;
  String cityNameEn;
  String stateNameEn;
  String countryNameEn;
  String educationTitleEn;
  String professionalTitleEn;
  String profilePhotoImage;
  String gothramTitleEn;
  String kolamTitleEn;
  String rasiMoonTitleEn;
  String starProTitleEn;
  String mProfileViewId;
  String timeOfBirth;
  dynamic birthPlace;
  String specialCaseTitleEn;
  String workCityName;
  String fOccupationTitleEn;
  String fKolamTitleEn;
  String mOccupationTitleEn;
  String mKolamTitleEn;
  String brotherSisterCountTitle;
  String mbcCountTitle;
  String scCountTitle;
  String mscCountTitle;
  String familyStatusTitleEn;
  String familyStatusTitleTa;
  String familyTypeTitleEn;
  dynamic familyValueTitleTa;
  String employeeInTitleEn;
  String maritalStatusTitleEn;
  String SevaiDhosam;
  String sevaiDhosam;
  String raguKedhu;
  String suthaJadhagam;
  String fatherNameEn;
  String motherNameEn;
  String regMobileNo;
  String alternateMobileNo;
  String salaryPerAnnumInRs;
  String organizationName;
  dynamic horoscopeDetail;
  dynamic AboutMySelf;
  dynamic About_Family;

  factory SingleMemberDetailModel.fromJson(Map<String, dynamic> json) => SingleMemberDetailModel(
    registrationId: json["RegistrationId"],
    regCode: json["RegCode"],
    memberNameEn: json["MemberName_en"],
    memberNameTa: json["MemberName_ta"],
    weightInKgs: json["WeightInKgs"],
    mDob: DateTime.parse(json["mDob"]),
    age: json["age"],
    profileCreatedForEn: json["ProfileCreatedFor_en"],
    profileCreatedForTa: json["ProfileCreatedFor_ta"],
    motherToungTitleEn: json["MotherToungTitle_en"],
    heightTitleEn: json["HeightTitle_en"],
    cityNameEn: json["CityName_en"],
    stateNameEn: json["StateName_en"],
    countryNameEn: json["CountryName_en"],
    educationTitleEn: json["EducationTitle_en"],
    professionalTitleEn: json["ProfessionalTitle_en"],
    profilePhotoImage: json["ProfilePhotoImage"],
    gothramTitleEn: json["GothramTitle_en"],
    kolamTitleEn: json["KolamTitle_en"],
    rasiMoonTitleEn: json["RasiMoonTitle_en"],
    starProTitleEn: json["StarProTitle_en"],
    mProfileViewId: json["mProfileViewId"],
    timeOfBirth: json["TimeOfBirth"],
    birthPlace: json["BirthPlace"],
    specialCaseTitleEn: json["SpecialCaseTitle_en"],
    workCityName: json["WorkCityName"],
    fOccupationTitleEn: json["fOccupationTitle_en"],
    fKolamTitleEn: json["fKolamTitle_en"],
    mOccupationTitleEn: json["mOccupationTitle_en"],
    mKolamTitleEn: json["mKolamTitle_en"],
    brotherSisterCountTitle: json["BrotherSisterCountTitle"],
    mbcCountTitle: json["mbc_CountTitle"],
    scCountTitle: json["sc_CountTitle"],
    mscCountTitle: json["msc_CountTitle"],
    familyStatusTitleEn: json["FamilyStatusTitle_en"],
    familyStatusTitleTa: json["FamilyStatusTitle_ta"],
    familyTypeTitleEn: json["FamilyTypeTitle_en"],
    familyValueTitleTa: json["FamilyValueTitle_ta"],
    employeeInTitleEn: json["EmployeeInTitle_en"],
    maritalStatusTitleEn: json["MaritalStatusTitle_en"],
    sevaiDhosam: json["SevaiDhosam"],
    raguKedhu: json["RaguKedhu"],
    suthaJadhagam: json["SuthaJadhagam"],
    fatherNameEn: json["FatherName_en"],
    motherNameEn: json["MotherName_en"],
    regMobileNo: json["RegMobileNo"],
    alternateMobileNo: json["AlternateMobileNo"],
    salaryPerAnnumInRs: json["SalaryPerAnnumInRs"],
    organizationName: json["OrganizationName"],
    horoscopeDetail: json["Horoscope_Detail"],
    AboutMySelf: json["AboutMySelf"],
    About_Family: json["About_Family"],
  );

  Map<String, dynamic> toJson() => {
    "RegistrationId": registrationId,
    "RegCode": regCode,
    "MemberName_en": memberNameEn,
    "MemberName_ta": memberNameTa,
    "WeightInKgs": weightInKgs,
    "mDob": "${mDob?.year.toString().padLeft(4, '0')}-${mDob?.month.toString().padLeft(2, '0')}-${mDob?.day.toString().padLeft(2, '0')}",
    "age": age,
    "ProfileCreatedFor_en": profileCreatedForEn,
    "ProfileCreatedFor_ta": profileCreatedForTa,
    "MotherToungTitle_en": motherToungTitleEn,
    "HeightTitle_en": heightTitleEn,
    "CityName_en": cityNameEn,
    "StateName_en": stateNameEn,
    "CountryName_en": countryNameEn,
    "EducationTitle_en": educationTitleEn,
    "ProfessionalTitle_en": professionalTitleEn,
    "ProfilePhotoImage": profilePhotoImage,
    "GothramTitle_en": gothramTitleEn,
    "KolamTitle_en": kolamTitleEn,
    "RasiMoonTitle_en": rasiMoonTitleEn,
    "StarProTitle_en": starProTitleEn,
    "mProfileViewId": mProfileViewId,
    "TimeOfBirth": timeOfBirth,
    "BirthPlace": birthPlace,
    "SpecialCaseTitle_en": specialCaseTitleEn,
    "WorkCityName": workCityName,
    "fOccupationTitle_en": fOccupationTitleEn,
    "fKolamTitle_en": fKolamTitleEn,
    "mOccupationTitle_en": mOccupationTitleEn,
    "mKolamTitle_en": mKolamTitleEn,
    "BrotherSisterCountTitle": brotherSisterCountTitle,
    "mbc_CountTitle": mbcCountTitle,
    "sc_CountTitle": scCountTitle,
    "msc_CountTitle": mscCountTitle,
    "FamilyStatusTitle_en": familyStatusTitleEn,
    "FamilyStatusTitle_ta": familyStatusTitleTa,
    "FamilyTypeTitle_en": familyTypeTitleEn,
    "FamilyValueTitle_ta": familyValueTitleTa,
    "EmployeeInTitle_en": employeeInTitleEn,
    "MaritalStatusTitle_en": maritalStatusTitleEn,
    "SevaiDhosam": sevaiDhosam,
    "RaguKedhu": raguKedhu,
    "SuthaJadhagam": suthaJadhagam,
    "FatherName_en": fatherNameEn,
    "MotherName_en": motherNameEn,
    "RegMobileNo": regMobileNo,
    "AlternateMobileNo": alternateMobileNo,
    "SalaryPerAnnumInRs": salaryPerAnnumInRs,
    "OrganizationName": organizationName,
    "Horoscope_Detail": horoscopeDetail,
    "AboutMySelf": AboutMySelf,
    "About_Family": About_Family,
  };
}
