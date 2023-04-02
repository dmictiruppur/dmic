import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kannada_devangar/core/custom_snackbar.dart';
import 'package:kannada_devangar/core/open_url.dart';
import 'package:kannada_devangar/core/urls.dart';
import 'package:kannada_devangar/models/member_login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class LoginService{
  static SharedPreferences sharedPreferences;
  static Dio dio = new Dio();

  @override
  static Future<MemberLoginModel> MemberLogin(String identifier, String password) async {
    try{
      final body = {'UserName': identifier, 'Password': password};
      final response = await dio.post(URLs.authLocal,
          data: body, options: Options(headers: OpenUrl().setHeaders()));
      if(response.statusCode == 200){
        if(response.data['error'] == false){
          CustomSnackBar().ShowSuccessSnackBar("Success", response.data['message']);
          //return response.data['user'];
          return MemberLoginModel.fromJson(response.data['user']);
        }
        else{
          CustomSnackBar().ShowFailureSnackBar("Failed", response.data['message']);
          return null;
        }
      }
      else{
        CustomSnackBar().ShowFailureSnackBar("Failed", response.data['message']);
        return null;
      }
    } on DioError  catch (ex) {
      CustomSnackBar().ShowFailureSnackBar(ex.type.toString(), ex.message);
      return null;
      //throw Exception(ex.type.toString() + "  - " + ex.message);
    }
  }

  static Future MemberSignup(String Username, String password, String EmailId, String MobileNo) async {
    try{
      final body = {'AadharNumber': Username, 'Password': password, 'EmailId': EmailId, 'MobileNumber': MobileNo};
      final response = await dio.post(URLs.member_register,
          data: body, options: Options(headers: OpenUrl().setHeaders()));
      print(response);
      if(response.statusCode == 200){
        if(response.data['error'] == false){
          //CustomSnackBar().ShowSuccessSnackBar("Success", response.data['message']);
          return response.data;
        }
        else{
          CustomSnackBar().ShowFailureSnackBar("Failed", response.data['message']);
          return null;
        }
      }
      else{
        CustomSnackBar().ShowFailureSnackBar("Failed", response.data['message']);
        return null;
      }
    } on DioError  catch (ex) {
      CustomSnackBar().ShowFailureSnackBar(ex.type.toString(), ex.message);
      return null;
      //throw Exception(ex.type.toString() + "  - " + ex.message);
    }
  }
}