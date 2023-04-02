import 'package:kannada_devangar/core/urls.dart';
import 'package:kannada_devangar/models/SearchMembersListModel.dart';
import 'package:dio/dio.dart';
import 'package:kannada_devangar/models/member_order_detail_model.dart';
import 'package:kannada_devangar/models/member_profile_view_model.dart';
import 'package:kannada_devangar/models/package_model.dart';
import 'package:kannada_devangar/models/single_member_detail_model.dart';
import 'package:http/http.dart' as http;

//const baseUrl = URLs.search_members;
//const OrderListUrl = URLs.orderdetail;

class MyApiClient {
  static Dio dio = new Dio();
  static var client = http.Client();

  static Future<List<SearchMembersListModel>> getTodo(
      String MemberId,
      String AgeFrom,
      String AgeTo,
      String maritualstatus,
      String kolam,
      String gothram,
      String raasimoon, String starpro, String sevadhosam, String raadukedhu, String suthajaadhagam, String RegCode
      ) async {
    final body = {
      'MemberId': MemberId,
      'AgeFrom': AgeFrom.toString(),
      'AgeTo': AgeTo.toString(),
      'maritualstatus': maritualstatus.toString(),
      'kolam': kolam.toString(),
      'gothram': gothram.toString(),
      'raasimoon': raasimoon.toString(),
      'starpro':starpro.toString(),
      'sevadhosam': sevadhosam.toString(),
      'raadukedhu': raadukedhu.toString(),
      'suthajaadhagam': suthajaadhagam.toString(),
      'RegCode': RegCode.toString()
    };
    print(body);
    var response = await dio.post(URLs.search_members,
        data: body, options: Options(headers: _setHeaders()));
    if (response.statusCode == 200) {
      var data = response.data;
      //return searchMembersListModelFromJson(data);
      return (data as List)
          .map((p) => SearchMembersListModel.fromJson(p))
          .toList();
    } else {
      return null;
    }
  }

  static Future<List<MemberOrderDetailModel>> GetOrderDetail(String RegistrationId) async {
    try {
      final body = {'MemberId': RegistrationId.toString()};
      var response = await dio.post(URLs.orderdetail,
          data: body, options: Options(headers: _setHeaders()));
      if (response.statusCode == 200) {
        var data = response.data;
        return (data as List)
            .map((p) => MemberOrderDetailModel.fromJson(p))
            .toList();
      } else {
        print('err');
      }
    } catch (_) {}
  }

  static Future<MemberOrderDetailModel> GetOrderDetail_New(String RegistrationId) async {
    try {
      final body = {'MemberId': RegistrationId.toString()};
      var response = await dio.post(URLs.orderdetail,
          data: body, options: Options(headers: _setHeaders()));
      if (response.statusCode == 200) {
        var data = response.data;
        //print(data);
        final note =  MemberOrderDetailModel(
            orderId : data['OrderId'],
          registerationId : data['RegisterationId'],
          orderDetailId : data['OrderDetailId'],
          orderDate : data['OrderDate'] != null ? DateTime.parse(data['OrderDate']) : null,
          expireDate : data['ExpireDate'] != null ? DateTime.parse(data['ExpireDate']) : null,
          orderTime : data['OrderTime'],
          profileCount : data['ProfileCount'],
          viewedProfileCount : data['ViewedProfileCount'],
          paidCost : data['PaidCost'],
          isExpired : data['IsExpired'],
          balViewCount : data['BalViewCount'],
          packageNameTitleEn : data['PackageNameTitle_en'],
          packageId : data['PackageId'],
          remDays : data['RemDays'],
        );
        return note;
      } else {
        print('err');
        return null;
      }
    } catch (_) {}
  }

  static Future GetOrderDetail_New_WithoutModel(String RegistrationId) async {
    try {
      final body = {'MemberId': RegistrationId.toString()};
      var response = await dio.post(URLs.orderdetail,
          data: body, options: Options(headers: _setHeaders()));
      //print(response);
      if (response.statusCode == 200) {
        var data = response.data;
        //print(data);
        return data;
      } else {
        print('err');
      }
    } catch (_) {}
  }

  static Future<SingleMemberDetailModel> FetchSingleMembersProfile(MemberId, sRegistrationId) async {
    final body = {'MemberId': MemberId, 'sRegistrationId': sRegistrationId};
    final response = await dio.post(URLs.single_member_detail,
        data: body, options: Options(headers: _setHeaders()));
    //print(response);
    //print(body);
    if (response.statusCode == 200) {
      var jsonString = response.data;
      return SingleMemberDetailModel.fromJson(jsonString);
    } else {
      return null;
    }
  }

  /*static Future<List<SearchMembersListModel>> _getTodo() async {
    final body = {
      'MemberId': '4241',
      'AgeFrom': '18',
      'AgeTo': '50',
      'maritualstatus': '3',
      'kolam': '0',
      'gothram': '0',
      'raasimoon': '0',
      'starpro': '0',
      'sevadhosam': '0',
      'raadukedhu': '0',
      'suthajaadhagam': '0',
      'RegCode': null
    };
    var response = await dio.post(baseUrl,
        data: body, options: Options(headers: _setHeaders()));
    if (response.statusCode == 200) {
      var data = response.data;
      return searchMembersListModelFromJson(data);
    } else {
      return null;
    }
  }*/

  /*static GetOrderDetail_old() async {
    try {
      final body = {'MemberId': '4241'};
      var response = await dio.post(OrderListUrl,
          data: body, options: Options(headers: _setHeaders()));
      if (response.statusCode == 200) {
        Iterable jsonRespone = response.data['user'];
        print(jsonRespone);
        List<MemberOrderDetailModel> listMyModel = jsonRespone
            .map((model) => MemberOrderDetailModel.fromJson(model))
            .toList();
        return listMyModel;
      } else {
        print('err');
      }
    } catch (_) {}
  }*/

  static Future<PackageModel> FetchPaymentType(MemberId, PackageId) async {
    final body = {'MemberId': MemberId, 'PackageId': PackageId};
    final response = await dio.post(URLs.show_paymentlist,
        data: body, options: Options(headers: _setHeaders()));
    //print(response);
    if (response.statusCode == 200) {
      var jsonString = response.data;
      return PackageModel.fromJson(jsonString);
    } else {
      return null;
    }
  }

  static Future<MemberProfileViewModel> FetchSMyProfileData(MemberId) async {
    final body = {'MemberId': MemberId};
    final response = await dio.post(URLs.member_profile_view,
        data: body, options: Options(headers: _setHeaders()));
    //print(response);
    if (response.statusCode == 200) {
      var jsonString = response.data;
      return MemberProfileViewModel.fromJson(jsonString);
    } else {
      return null;
    }
  }
}

_setHeaders() => {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Access-Control_allow_orgin': '*',
    };
