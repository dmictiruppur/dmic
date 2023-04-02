import 'package:dio/dio.dart';
import 'package:kannada_devangar/core/urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UnlockProfileViewService {
  static Dio dio = new Dio();
  SharedPreferences sharedPreferences;

  static Future FetchUnlockedProfile(RegistrationId, ProfileCount) async {
    final body = {'MemberId': RegistrationId};
    final response = await dio.post(URLs.unlockprofile5,
        data: body, options: Options(headers: _setHeaders()));
    //print(response);
    if (response.statusCode == 200) {
      var jsonString = response.data;
      return jsonString;
      //return unlockProfileModelFromJson(jsonString);
      /* List jData =  json.decode(response.data);
      return jData.map((jData) => new MemberUnlockProfile.fromJson(jData)).toList();*/
    } else {
      return null;
    }
  }
}

_setHeaders() => {
  'Content-type': 'application/json',
  'Accept': 'application/json',
  'Access-Control_Allow_Origin': '*'
};
