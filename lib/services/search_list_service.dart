import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:kannada_devangar/core/urls.dart';
import 'package:get/get.dart';
import 'package:kannada_devangar/models/SearchMembersListModel.dart';

class SearchListService {
  static Dio dio = new Dio();

  static Future fetchSearchMembersList(
      MemberId,
      AgeFrom,
      AgeTo,
      maritualstatus,
      kolam,
      gothram,
      raasimoon,
      starpro,
      sevashosam,
      raadukedhu,
      suthajaadhagam,
      RegCode) async {
    final body = {
      'MemberId': MemberId,
      'AgeFrom': AgeFrom,
      'AgeTo': AgeTo,
      'maritualstatus': maritualstatus,
      'kolam': kolam,
      'gothram': gothram,
      'raasimoon': raasimoon,
      'starpro': starpro,
      'sevadhosam': sevashosam,
      'raadukedhu': raadukedhu,
      'suthajaadhagam': suthajaadhagam,
      'RegCode': RegCode
    };
    final response = await dio.post(URLs.search_members,
        data: body, options: Options(headers: _setHeaders()));
    //print(response);
    if (response.statusCode == 200) {
      var jsonString = response.data;
      /*for(var gs in jsonString){
        notes.add(SearchMemberListModel.fromJson(gs));
      }*/
      return jsonString;
      //return notes;
    } else {
      //print('error - get : ' + response.data['message']);
      Get.snackbar("Error - Fetch Search Members - ", response.data);
      return null;
    }
  }

  getAll(
      MemberId,
      AgeFrom,
      AgeTo,
      maritualstatus,
      kolam,
      gothram,
      raasimoon,
      starpro,
      sevashosam,
      raadukedhu,
      suthajaadhagam,
      RegCode) async {
    try {
      final body = {
        'MemberId': MemberId,
        'AgeFrom': AgeFrom,
        'AgeTo': AgeTo,
        'maritualstatus': maritualstatus,
        'kolam': kolam,
        'gothram': gothram,
        'raasimoon': raasimoon,
        'starpro': starpro,
        'sevadhosam': sevashosam,
        'raadukedhu': raadukedhu,
        'suthajaadhagam': suthajaadhagam,
        'RegCode': RegCode
      };
      final response = await dio.post(URLs.search_members,
          data: body, options: Options(headers: _setHeaders()));
      if(response.statusCode == 200){
        Iterable jsonResponse = json.decode(response.data);
        List<SearchMembersListModel> listMyModel = jsonResponse.map((model) => SearchMembersListModel.fromJson(model)).toList();
        return listMyModel;
      }else {
        Get.snackbar("Error - Fetch Search Members - ", response.data);
        return null;
      }
    } catch(_){

    }
  }
}

_setHeaders() => {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Access-Control_Allow_Origin': '*'
    };
