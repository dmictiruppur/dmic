import 'dart:convert';
import 'dart:async';

class MemberProfileModel {
  String RegistrationId;
  String RegCode;

  MemberProfileModel({this.RegistrationId, this.RegCode});

  factory MemberProfileModel.fromJson(Map<String, dynamic> jsonData) {
    return MemberProfileModel(
      RegistrationId: jsonData['RegistrationId'],
      RegCode: jsonData['RegCode'],
    );
  }
}
