import 'package:dio/dio.dart';
import 'package:kannada_devangar/models/SearchMembersListModel.dart';
import 'package:meta/meta.dart';
import 'package:kannada_devangar/core/urls.dart';

class SearchDetailRepository{
  static Dio dio = new Dio();

  static Future<List<SearchMembersListModel>> getTodo(MemberId, AgeFrom, AgeTo, maritualstatus, kolam
      , gothram, raasimoon, starpro, sevadhosam, raadukedhu, suthajaadhagam, RegCode) async {
    final body = {
      'MemberId': MemberId.toString(),
      'AgeFrom': AgeFrom.toString(),
      'AgeTo': AgeTo.toString(),
      'maritualstatus': maritualstatus.toString(),
      'kolam': kolam.toString(),
      'gothram': gothram.toString(),
      'raasimoon': raasimoon.toString(),
      'starpro': starpro.toString(),
      'sevadhosam': sevadhosam.toString(),
      'raadukedhu':raadukedhu.toString(),
      'suthajaadhagam': suthajaadhagam.toString(),
      'RegCode': RegCode.toString()
    };
    var response = await dio.post(URLs.search_members,
        data: body, options: Options(headers: _setHeaders()));
    if (response.statusCode == 200) {
      var data = response.data;
      //return searchMembersListModelFromJson(data);
      return (data as List)
          .map((p) => SearchMembersListModel.fromJson(p))
          .toList();
    }
    else {
      return null;
    }
  }
}
_setHeaders() => {
  'Content-type': 'application/json',
  'Accept': 'application/json',
  'Access-Control_Allow_Origin': '*'
};