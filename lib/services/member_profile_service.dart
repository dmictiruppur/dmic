import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:kannada_devangar/core/open_url.dart';
import 'package:kannada_devangar/core/urls.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:get/get.dart';

class MemberProfileService {
  static Dio dio = new Dio();
  SharedPreferences sharedPreferences;

  /*static Future FetchMembersProfileData(RegistrationId) async {
    final body = {'MemberId': RegistrationId};
    final response = await dio.post(URLs.myprofileview,
        data: body, options: Options(headers: OpenUrl().setHeaders()));
    if (response.statusCode == 200) {
      var jsonString = response.data;
      //print(jsonString['user']);
      //MemberProfileModel->RegCode = jsonString['RegCode'];
      return jsonString['user'];
    } else {
      return null;
    }
  }*/

  static Future FetchMemberProfilePhoto(RegistrationId) async {
    final body = {'MemberId': RegistrationId};
    final response = await dio.post(URLs.member_image,
        data: body, options: Options(headers: OpenUrl().setHeaders()));
    //print(response);
    if (response.statusCode == 200) {
      var jsonString = response.data;
      return jsonString;
    } else {
      return null;
    }
  }

  static Future FetchSingleMembersProfile(MemberId, sRegistrationId) async {
    final body = {'MemberId': MemberId, 'sRegistrationId': sRegistrationId};
    final response = await dio.post(URLs.single_member_detail,
        data: body, options: Options(headers: OpenUrl().setHeaders()));
    //print(response);
    if (response.statusCode == 200) {
      var jsonString = response.data;
      //print(jsonString['user']);
      /*for (var gs in jsonString) {
        notes.add(MemberProfileModel.fromJson(gs));
      }*/
      //MemberProfileModel->RegCode = jsonString['RegCode'];
      return jsonString;
    } else {
      return null;
    }
  }
}
