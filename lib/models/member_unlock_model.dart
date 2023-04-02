import 'dart:convert';
import 'dart:async';

class MemberUnlockProfile{
  final String RegistrationId;
  final String RegCode;

  MemberUnlockProfile({this.RegistrationId, this.RegCode});

  factory MemberUnlockProfile.fromJson(Map<String, dynamic> jsonData){
    return MemberUnlockProfile(
        RegistrationId : jsonData['RegistrationId'],
      RegCode : jsonData['RegCode'],
    );
  }
}