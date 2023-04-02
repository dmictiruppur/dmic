// To parse this JSON data, do
//
//     final unlockProfileModel = unlockProfileModelFromJson(jsonString);

import 'dart:convert';

List<UnlockProfileModel> unlockProfileModelFromJson(String str) => List<UnlockProfileModel>.from(json.decode(str).map((x) => UnlockProfileModel.fromJson(x)));

String unlockProfileModelToJson(List<UnlockProfileModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UnlockProfileModel {
  UnlockProfileModel({
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
    this.religionTitleEn,
    this.religionTitleTa,
    this.profilePhotoImage,
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
  DateTime mDob;
  String age;
  dynamic profileCreatedForEn;
  dynamic profileCreatedForTa;
  dynamic motherToungTitleEn;
  dynamic motherToungTitleTa;
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
  dynamic religionTitleEn;
  dynamic religionTitleTa;
  dynamic profilePhotoImage;

  factory UnlockProfileModel.fromJson(Map<String, dynamic> json) => UnlockProfileModel(
    registrationId: json["RegistrationId"],
    regCode: json["RegCode"],
    memberNameEn: json["MemberName_en"],
    memberNameTa: json["MemberName_ta"],
    motherToungId: json["MotherToungId"],
    genderId: json["GenderId"],
    maritalStatusId: json["MaritalStatusId"],
    heightId: json["HeightId"],
    weightInKgs: json["WeightInKgs"],
    kolamId: json["KolamId"],
    gothramId: json["GothramId"],
    rasiMoonId: json["RasiMoonId"],
    starProId: json["StarProId"],
    educationId: json["EducationId"],
    professionalId: json["ProfessionalId"],
    mDob: DateTime.parse(json["mDob"]),
    age: json["age"],
    profileCreatedForEn: json["ProfileCreatedFor_en"],
    profileCreatedForTa: json["ProfileCreatedFor_ta"],
    motherToungTitleEn: json["MotherToungTitle_en"],
    motherToungTitleTa: json["MotherToungTitle_ta"],
    heightTitleEn: json["HeightTitle_en"],
    heightTitleTa: json["HeightTitle_ta"],
    cityId: json["CityId"],
    stateId: json["StateId"],
    countryId: json["CountryId"],
    cityNameEn: json["CityName_en"],
    cityNameTa: json["CityName_ta"],
    stateNameEn: json["StateName_en"],
    stateNameTa: json["StateName_ta"],
    countryNameEn: json["CountryName_en"],
    countryNameTa: json["CountryName_ta"],
    educationTitleEn: json["EducationTitle_en"],
    educationTitleTa: json["EducationTitle_ta"],
    professionalTitleEn: json["ProfessionalTitle_en"],
    professionalTitleTa: json["ProfessionalTitle_ta"],
    religionTitleEn: json["ReligionTitle_en"],
    religionTitleTa: json["ReligionTitle_ta"],
    profilePhotoImage: json["ProfilePhotoImage"],
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
    "mDob": "${mDob?.year.toString().padLeft(4, '0')}-${mDob?.month.toString().padLeft(2, '0')}-${mDob?.day.toString().padLeft(2, '0')}",
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
    "ReligionTitle_en": religionTitleEn,
    "ReligionTitle_ta": religionTitleTa,
    "ProfilePhotoImage": profilePhotoImage,
  };
}
