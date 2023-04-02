import 'package:dio/dio.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kannada_devangar/core/urls.dart';
import 'package:kannada_devangar/utility/dialog_box.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:get/get.dart';
import 'package:meta/meta.dart';

class AuthServices {
  static Dio dio = new Dio();
  SharedPreferences sharedPreferences;

  Future login(String identifier, String password) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      final body = {'UserName': identifier, 'Password': password};
      final response = await dio.post(URLs.authLocal,
          data: body, options: Options(headers: _setHeaders()));
      //print(response.data['error']);
      //print(response.data['user']['RegistrationId']);
      if (response.data['error'] == false) {
        //print(response.data);
        Toast_Message(true, "Login Success");
        //UserModel.fromMap(response.data['user']);
        sharedPreferences.setString(
            'RegistrationId', response.data['user']['RegistrationId']);
        sharedPreferences.setString(
            'MemberName', response.data['user']['MemberName_en']);
        sharedPreferences.setString('ProfilePhoto1',
            response.data['user']['ProfilePhotoImaglogine_new']);
        sharedPreferences.setString(
            'ProfilePhoto2', response.data['user']['FullSizePhoto_new']);
        sharedPreferences.setString(
            'RegCode', response.data['user']['RegCode']);

        GetStorage().write('MemberId', response.data['user']['RegistrationId']);
        GetStorage()
            .write('MemberName_en', response.data['user']['MemberName_en']);
        GetStorage().write('RegCode', response.data['user']['RegCode']);
      } else {
        Toast_Message(false, "Invalid Login Detail");
      }
      return response.data;
    } catch (e) {
      print("ERRR: " + e.toString());
      Toast_Message(false, e.toString());
    }
  }
}

_setHeaders() => {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Access-Control_Allow_Origin': '*'
    };
