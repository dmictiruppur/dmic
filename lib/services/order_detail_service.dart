import 'package:dio/dio.dart';
import 'package:kannada_devangar/core/custom_snackbar.dart';
import 'package:kannada_devangar/core/urls.dart';
import 'package:kannada_devangar/models/orderdetail_model.dart';
import 'package:kannada_devangar/utility/dialog_box.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderDetailService {
  static Dio dio = new Dio();
  SharedPreferences sharedPreferences;

  static Future<List<OrderDetailModel>> fetchOrderDetail(RegistrationId) async {
    final body = {'MemberId': RegistrationId};
    final response = await dio.post(URLs.orderdetail,
        data: body, options: Options(headers: _setHeaders()));
    if (response.statusCode == 200) {
      var jsonString = response.data['user'];
      //OrderDetailModel['OrderId'] = response.data['user']['OrderId'];
      OrderDetailModel.fromJson(jsonString);
    } else {
      print('error - get : ' + response.data['message']);
    }
  }

  static Future fetchMembersOrderDetail(RegistrationId) async {
    try{
      final body = {'MemberId': RegistrationId};
      final response = await dio.post(URLs.orderdetail,
          data: body, options: Options(headers: _setHeaders()));
      if (response.statusCode == 200) {
        if(response.data['error'] == false){
          //CustomSnackBar().ShowSuccessSnackBar("Success", response.data['message']);
          //return response.data['user'];
          var jsonString = response.data['orderdata'];
          return jsonString;
        }
        else{
          CustomSnackBar().ShowFailureSnackBar("Failed", response.data['message']);
          return null;
        }
      } else {
        CustomSnackBar().ShowFailureSnackBar("Failed", response.data['message']);
        return null;
      }
    } on DioError  catch (ex) {
      CustomSnackBar().ShowFailureSnackBar(ex.type.toString(), ex.message);
      return null;
      //throw Exception(ex.type.toString() + "  - " + ex.message);
    }
  }

  static Future UnlockMemberProfile(String sRegistrationId,
      String mRegistrationId, String mOrderId, String mOrderDetail) async {
    final body = {
      'sRegistrationId': sRegistrationId,
      'MemberId': mRegistrationId,
      'OrderId': mOrderId,
      'OrderDetailId': mOrderDetail,
    };
    final response = await dio.post(URLs.unlock_profile,
        data: body, options: Options(headers: _setHeaders()));
    if (response.statusCode == 200) {
      var jsonString = response.data;
      if (jsonString['error'] == false) {
        Toast_Message(true, "Profile Unlocked Successfully...!");
      }
      else{
        Toast_Message(true, "Problem in Unlock Profile...!");
      }
      return jsonString;
    }
    else {
      print('error - get : ' + response.data['message']);
    }
  }
}

_setHeaders() => {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Access-Control_Allow_Origin': '*'
    };
