// To parse this JSON data, do
//
//     final searchMembersListModel = searchMembersListModelFromJson(jsonString);

import 'dart:convert';

List<SearchMembersListModel> searchMembersListModelFromJson(String str) => List<SearchMembersListModel>.from(json.decode(str).map((x) => SearchMembersListModel.fromJson(x)));

String searchMembersListModelToJson(List<SearchMembersListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SearchMembersListModel {
  SearchMembersListModel({
    this.registrationId,
    this.regCode,
    this.memberNameEn,
    this.memberNameTa,
    this.motherToungId,
    this.genderId,
    this.maritalStatusId,
    this.heightId,
    this.weightInKgs,
    this.kolamId,
    this.gothramId,
    this.rasiMoonId,
    this.starProId,
    this.educationId,
    this.professionalId,
    this.mDob,
    this.age,
    this.profileCreatedForEn,
    this.profileCreatedForTa,
    this.motherToungTitleEn,
    this.motherToungTitleTa,
    this.heightTitleEn,
    this.heightTitleTa,
    this.cityId,
    this.stateId,
    this.countryId,
    this.cityNameEn,
    this.cityNameTa,
    this.stateNameEn,
    this.stateNameTa,
    this.countryNameEn,
    this.countryNameTa,
    this.educationTitleEn,
    this.educationTitleTa,
    this.professionalTitleEn,
    this.professionalTitleTa,
    this.profilePhotoImage,
    this.gothramTitleEn,
    this.gothramTitleTa,
    this.kolamTitleEn,
    this.kolamTitleTa,
    this.rasiMoonTitleEn,
    this.rasiMoonTitleTa,
    this.starProTitleEn,
    this.starProTitleTa,
    this.orderId,
    this.orderDetailId,
    this.sPackageId,
    this.mProfileViewId,
  });

  String registrationId;
  String regCode;
  String memberNameEn;
  String memberNameTa;
  String motherToungId;
  String genderId;
  String maritalStatusId;
  String heightId;
  String weightInKgs;
  String kolamId;
  String gothramId;
  String rasiMoonId;
  String starProId;
  String educationId;
  String professionalId;
  String mDob;
  String age;
  String profileCreatedForEn;
  String profileCreatedForTa;
  String motherToungTitleEn;
  String motherToungTitleTa;
  String heightTitleEn;
  String heightTitleTa;
  String cityId;
  String stateId;
  String countryId;
  String cityNameEn;
  String cityNameTa;
  String stateNameEn;
  String stateNameTa;
  String countryNameEn;
  String countryNameTa;
  String educationTitleEn;
  String educationTitleTa;
  String professionalTitleEn;
  String professionalTitleTa;
  String profilePhotoImage;
  String gothramTitleEn;
  String gothramTitleTa;
  String kolamTitleEn;
  String kolamTitleTa;
  String rasiMoonTitleEn;
  String rasiMoonTitleTa;
  String starProTitleEn;
  String starProTitleTa;
  String orderId;
  String orderDetailId;
  String sPackageId;
  String mProfileViewId;

  factory SearchMembersListModel.fromJson(Map<String, dynamic> json) => SearchMembersListModel(
    registrationId: json["RegistrationId"].toString(),
    regCode: json["RegCode"].toString(),
    memberNameEn: json["MemberName_en"].toString(),
    memberNameTa: json["MemberName_ta"].toString(),
    motherToungId: json["MotherToungId"].toString(),
    genderId: json["GenderId"].toString(),
    maritalStatusId: json["MaritalStatusId"].toString(),
    heightId: json["HeightId"].toString(),
    weightInKgs: json["WeightInKgs"].toString(),
    kolamId: json["KolamId"].toString(),
    gothramId: json["GothramId"].toString(),
    rasiMoonId: json["RasiMoonId"].toString(),
    starProId: json["StarProId"].toString(),
    educationId: json["EducationId"].toString(),
    professionalId: json["ProfessionalId"].toString(),
    mDob: json["mDob"].toString(),
    age: json["age"].toString(),
    profileCreatedForEn: json["ProfileCreatedFor_en"].toString(),
    profileCreatedForTa: json["ProfileCreatedFor_ta"].toString(),
    motherToungTitleEn: json["MotherToungTitle_en"].toString(),
    motherToungTitleTa: json["MotherToungTitle_ta"].toString(),
    heightTitleEn: json["HeightTitle_en"].toString(),
    heightTitleTa: json["HeightTitle_ta"].toString(),
    cityId: json["CityId"].toString(),
    stateId: json["StateId"].toString(),
    countryId: json["CountryId"].toString(),
    cityNameEn: json["CityName_en"].toString(),
    cityNameTa: json["CityName_ta"].toString(),
    stateNameEn: json["StateName_en"].toString(),
    stateNameTa: json["StateName_ta"].toString(),
    countryNameEn: json["CountryName_en"].toString(),
    countryNameTa: json["CountryName_ta"].toString(),
    educationTitleEn: json["EducationTitle_en"].toString(),
    educationTitleTa: json["EducationTitle_ta"].toString(),
    professionalTitleEn: json["ProfessionalTitle_en"].toString(),
    professionalTitleTa: json["ProfessionalTitle_ta"].toString(),
    profilePhotoImage: json["ProfilePhotoImage"].toString(),
    gothramTitleEn: json["GothramTitle_en"].toString(),
    gothramTitleTa: json["GothramTitle_ta"].toString(),
    kolamTitleEn: json["KolamTitle_en"].toString(),
    kolamTitleTa: json["KolamTitle_ta"].toString(),
    rasiMoonTitleEn: json["RasiMoonTitle_en"].toString(),
    rasiMoonTitleTa: json["RasiMoonTitle_ta"].toString(),
    starProTitleEn: json["StarProTitle_en"].toString(),
    starProTitleTa: json["StarProTitle_ta"].toString(),
    orderId: json["OrderId"].toString(),
    orderDetailId: json["OrderDetailId"].toString(),
    sPackageId: json["sPackageId"].toString(),
    mProfileViewId: json["mProfileViewId"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "RegistrationId": registrationId,
    "RegCode": regCode,
    "MemberName_en": memberNameEn,
    "MemberName_ta": memberNameTa,
    "MotherToungId": motherToungId,
    "GenderId": genderId,
    "MaritalStatusId": maritalStatusId,
    "HeightId": heightId,
    "WeightInKgs": weightInKgs,
    "KolamId": kolamId,
    "GothramId": gothramId,
    "RasiMoonId": rasiMoonId,
    "StarProId": starProId,
    "EducationId": educationId,
    "ProfessionalId": professionalId,
    "mDob": mDob,
    "age": age,
    "ProfileCreatedFor_en": profileCreatedForEn,
    "ProfileCreatedFor_ta": profileCreatedForTa,
    "MotherToungTitle_en": motherToungTitleEn,
    "MotherToungTitle_ta": motherToungTitleTa,
    "HeightTitle_en": heightTitleEn,
    "HeightTitle_ta": heightTitleTa,
    "CityId": cityId,
    "StateId": stateId,
    "CountryId": countryId,
    "CityName_en": cityNameEn,
    "CityName_ta": cityNameTa,
    "StateName_en": stateNameEn,
    "StateName_ta": stateNameTa,
    "CountryName_en": countryNameEn,
    "CountryName_ta": countryNameTa,
    "EducationTitle_en": educationTitleEn,
    "EducationTitle_ta": educationTitleTa,
    "ProfessionalTitle_en": professionalTitleEn,
    "ProfessionalTitle_ta": professionalTitleTa,
    "ProfilePhotoImage": profilePhotoImage,
    "GothramTitle_en": gothramTitleEn,
    "GothramTitle_ta": gothramTitleTa,
    "KolamTitle_en": kolamTitleEn,
    "KolamTitle_ta": kolamTitleTa,
    "RasiMoonTitle_en": rasiMoonTitleEn,
    "RasiMoonTitle_ta": rasiMoonTitleTa,
    "StarProTitle_en": starProTitleEn,
    "StarProTitle_ta": starProTitleTa,
    "OrderId": orderId,
    "OrderDetailId": orderDetailId,
    "sPackageId": sPackageId,
    "mProfileViewId": mProfileViewId,
  };
}