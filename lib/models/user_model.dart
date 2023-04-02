import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

class UserModel {
  UserModel(
      {this.RegistrationId,
      this.MemberName_ta,
      this.NewAadharNo,
      this.EmailId,
      this.mPassword,
      this.MemberName_en,
      this.RegMobileNo,
      this.ProfilePhotoImage_new,
      this.FullSizePhoto_new});

  final String RegistrationId;
  final String MemberName_en;
  final String MemberName_ta;
  final String NewAadharNo;
  final String EmailId;
  final String mPassword;
  final String RegMobileNo;
  final String ProfilePhotoImage_new;
  final String FullSizePhoto_new;

  UserModel copyWith({
    String RegistrationId,
    String MemberName_ta,
    String NewAadharNo,
  }) =>
      UserModel(
          RegistrationId: RegistrationId ?? this.RegistrationId,
          NewAadharNo: NewAadharNo ?? this.NewAadharNo,
          MemberName_ta: MemberName_ta ?? this.MemberName_ta,
          MemberName_en: MemberName_en ?? this.MemberName_en,
          EmailId: EmailId ?? this.EmailId,
          mPassword: mPassword ?? this.mPassword,
          RegMobileNo: RegMobileNo ?? this.RegMobileNo,
          ProfilePhotoImage_new:
              ProfilePhotoImage_new ?? this.ProfilePhotoImage_new,
          FullSizePhoto_new: FullSizePhoto_new ?? this.FullSizePhoto_new);

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        RegistrationId: json["RegistrationId"],
        NewAadharNo: json["NewAadharNo"],
        MemberName_ta: json["MemberName_ta"],
        MemberName_en: json["MemberName_en"],
        EmailId: json["EmailId"],
        mPassword: json["mPassword"],
        RegMobileNo: json["RegMobileNo"],
        ProfilePhotoImage_new: json["ProfilePhotoImage_new"],
        FullSizePhoto_new: json["FullSizePhoto_new"],
      );

  Map<String, dynamic> toMap() => {
        "RegistrationId": RegistrationId,
        "MemberName_ta": MemberName_ta,
        "NewAadharNo": NewAadharNo,
        "MemberName_en": MemberName_en,
        "EmailId": EmailId,
        "mPassword": mPassword,
        "RegMobileNo": RegMobileNo,
        "ProfilePhotoImage_new": ProfilePhotoImage_new,
        "FullSizePhoto_new": FullSizePhoto_new,
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is UserModel &&
        o.RegistrationId == RegistrationId &&
        o.MemberName_ta == MemberName_ta &&
        o.MemberName_en == MemberName_en &&
        o.EmailId == EmailId &&
        o.mPassword == mPassword &&
        o.RegMobileNo == RegMobileNo &&
        o.ProfilePhotoImage_new == ProfilePhotoImage_new &&
        o.FullSizePhoto_new == FullSizePhoto_new &&
        o.NewAadharNo == NewAadharNo;
  }

  @override
  int get hashCode {
    return RegistrationId.hashCode ^
        MemberName_ta.hashCode ^
        MemberName_en.hashCode ^
        EmailId.hashCode ^
        mPassword.hashCode ^
        RegMobileNo.hashCode ^
        ProfilePhotoImage_new.hashCode ^
        FullSizePhoto_new.hashCode ^
        NewAadharNo.hashCode;
  }

  @override
  String toString() {
    return 'UserModel(RegistrationId: $RegistrationId, '
        'MemberName_ta: $MemberName_ta, NewAadharNo: $NewAadharNo, '
        'MemberName_en: $MemberName_en, EmailId: $EmailId, mPassword: $mPassword, RegMobileNo: $RegMobileNo, ProfilePhotoImage_new: $ProfilePhotoImage_new, FullSizePhoto_new: $FullSizePhoto_new)';
  }
}

@JsonSerializable()
class User {
  User({this.userName, this.password});

  String userName;
  String password;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

User _$UserFromJson(Map<String, dynamic> json) {
  return User()
    ..userName = json['userName'] as String
    ..password = json['password'] as String;
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'userName': instance.userName,
  'password': instance.password
};
