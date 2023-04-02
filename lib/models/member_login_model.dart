import 'dart:convert';
MemberLoginModel memberLoginModelFromJson(String str) => MemberLoginModel.fromJson(json.decode(str));
String memberLoginModelToJson(MemberLoginModel data) => json.encode(data.toJson());

class MemberLoginModel {
  MemberLoginModel({
    this.registrationId,
    this.emailId,
    this.mPassword,
    this.memberNameEn,
    this.memberNameTa,
    this.regMobileNo,
    this.newAadharNo,
    this.profilePhotoImage,
    this.fullSizePhoto,
    this.regCode,
    this.profilePhotoImageNew,
    this.fullSizePhotoNew,
  });

  String registrationId;
  String emailId;
  String mPassword;
  String memberNameEn;
  String memberNameTa;
  String regMobileNo;
  String newAadharNo;
  String profilePhotoImage;
  String fullSizePhoto;
  String regCode;
  String profilePhotoImageNew;
  String fullSizePhotoNew;

  factory MemberLoginModel.fromJson(Map<String, dynamic> json) => MemberLoginModel(
    registrationId: json["RegistrationId"],
    emailId: json["EmailId"],
    mPassword: json["mPassword"],
    memberNameEn: json["MemberName_en"],
    memberNameTa: json["MemberName_ta"],
    regMobileNo: json["RegMobileNo"],
    newAadharNo: json["NewAadharNo"],
    profilePhotoImage: json["ProfilePhotoImage"],
    fullSizePhoto: json["FullSizePhoto"],
    regCode: json["RegCode"],
    profilePhotoImageNew: json["ProfilePhotoImage_new"],
    fullSizePhotoNew: json["FullSizePhoto_new"],
  );

  Map<String, dynamic> toJson() => {
    "RegistrationId": registrationId,
    "EmailId": emailId,
    "mPassword": mPassword,
    "MemberName_en": memberNameEn,
    "MemberName_ta": memberNameTa,
    "RegMobileNo": regMobileNo,
    "NewAadharNo": newAadharNo,
    "ProfilePhotoImage": profilePhotoImage,
    "FullSizePhoto": fullSizePhoto,
    "RegCode": regCode,
    "ProfilePhotoImage_new": profilePhotoImageNew,
    "FullSizePhoto_new": fullSizePhotoNew,
  };
}