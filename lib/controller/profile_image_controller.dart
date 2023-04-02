import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:kannada_devangar/core/urls.dart';
import 'package:kannada_devangar/services/member_profile_service.dart';
import 'package:kannada_devangar/utility/app_routers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';

class ProfileImageController extends GetxController {
  SharedPreferences sharedPreferences;

  RxString RegistrationId = "".obs;
  RxString ProfilePhotoImage = "".obs;
  RxString ProfilePhotoImage_new = "".obs;
  RxString FullSizePhoto = "".obs;
  RxString FullSizePhoto_new = "".obs;
  RxString AadharCardImage = "".obs;
  RxString AadharCardImage_new = "".obs;
  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;

  var cropImagePath = ''.obs;
  var cropImageSize = ''.obs;

  var compressImagePath = ''.obs;
  var compressImageSize = ''.obs;
  var isLoading = true.obs;
  static Dio dio = new Dio();

  static ProfileImageController get to => Get.find<ProfileImageController>();

  @override
  void onInit() async {
    // TODO: implement onInit
    imageCache.clear();
    sharedPreferences = await SharedPreferences.getInstance();
    SetRegistrationId(sharedPreferences.getString("RegistrationId").toString());
    fetchBasicDetail(RegistrationId.toString());
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void oncClose() {}

  void getImage_ImageController(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().getImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      selectedImageSize.value =
          ((File(selectedImagePath.value)).lengthSync() / 1024 / 1024)
                  .toStringAsFixed(2) +
              " MB";

      final cropImageFile = await ImageCropper().cropImage(
          sourcePath: selectedImagePath.value,
          maxWidth: 512,
          maxHeight: 512,
          compressFormat: ImageCompressFormat.jpg);
      cropImagePath.value = cropImageFile.path;
      cropImageSize.value =
          ((File(cropImagePath.value)).lengthSync() / 1024 / 1024)
                  .toStringAsFixed(2) +
              " MB";

      final dir = await Directory.systemTemp;
      final targetPath = dir.absolute.path + "/temp.jpg";
      var compressedFile = await FlutterImageCompress.compressAndGetFile(
          cropImagePath.value, targetPath,
          quality: 90);
      compressImagePath.value = compressedFile.path;
      compressImageSize.value =
          ((File(compressImagePath.value)).lengthSync() / 1024 / 1024)
                  .toStringAsFixed(2) +
              " MB";

      //uploadImage(RegistrationId.toString(), compressedFile);
    } else {
      Get.snackbar('Error', 'No image selected',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  void getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().getImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      selectedImageSize.value =
          ((File(selectedImagePath.value)).lengthSync() / 1024 / 1024)
                  .toStringAsFixed(2) +
              " MB";
    } else {
      Get.snackbar('Error', 'No image selected',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  void fetchBasicDetail(String RegistrationId) async {
    final bDetail =
        await MemberProfileService.FetchMemberProfilePhoto(RegistrationId);
    if (bDetail != '') {
      SetProfilePhotoImage(bDetail['ProfilePhotoImage'].toString());
      SetProfilePhotoImage_new(bDetail['ProfilePhotoImage_new'].toString());
      SetFullSizePhoto_new(bDetail['FullSizePhoto_new'].toString());
      SetFullSizePhoto(bDetail['FullSizePhoto'].toString());
      SetAadharCardImage(bDetail['AadharCardImage'].toString());
      SetAadharCardImage_new(bDetail['AadharCardImage_new'].toString());
      update();
    } else {
      Get.snackbar("Error : ", "Problem in Fetching Profile Data");
    }
  }

  void uploadProfileImage() async {
    Get.dialog(
      Center(
        child: Center(child: CircularProgressIndicator()),
      ),
      barrierDismissible: false,
    );
    isLoading.value = true;
    var request =
        http.MultipartRequest('POST', Uri.parse(URLs.profile_image_upload));
    request.fields['MemberId'] = RegistrationId.toString();
    var pic = await http.MultipartFile.fromPath(
        "image", selectedImagePath.toString());
    request.files.add(pic);
    var response = await request.send();
    //print(response);
    Get.back();
    if (response.statusCode == 200) {
      Get.snackbar('Success', 'File Uploaded...',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
      selectedImagePath.value = '';
      selectedImageSize.value = '';
      isLoading.value = false;
    } else {
      Get.snackbar('Error', 'File Upload Failed...',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
      isLoading.value = false;
    }
    fetchBasicDetail(RegistrationId.toString());
    Get.toNamed(Routes.profileimage);
  }

  void uploadFullSizeImage() async {
    Get.dialog(
      Center(
        child: Center(child: CircularProgressIndicator()),
      ),
      barrierDismissible: false,
    );
    isLoading.value = true;
    var request =
        http.MultipartRequest('POST', Uri.parse(URLs.upload_fullsize_photo));
    request.fields['MemberId'] = RegistrationId.toString();
    var pic = await http.MultipartFile.fromPath(
        "image", selectedImagePath.toString());
    request.files.add(pic);
    var response = await request.send();
    //print(response);
    Get.back();
    if (response.statusCode == 200) {
      Get.snackbar('Success', 'File Uploaded...',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
      selectedImagePath.value = '';
      selectedImageSize.value = '';
      isLoading.value = false;
    } else {
      Get.snackbar('Error', 'File Upload Failed...',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
      isLoading.value = false;
    }
    fetchBasicDetail(RegistrationId.toString());
    Get.toNamed(Routes.profileimage);
  }

  void uploadAadharImage() async {
    Get.dialog(
      Center(
        child: Center(child: CircularProgressIndicator()),
      ),
      barrierDismissible: false,
    );
    isLoading.value = true;
    var request =
        http.MultipartRequest('POST', Uri.parse(URLs.upload_aadhar_photo));
    request.fields['MemberId'] = RegistrationId.toString();
    var pic = await http.MultipartFile.fromPath(
        "image", selectedImagePath.toString());
    request.files.add(pic);
    var response = await request.send();
    //print(response);
    Get.back();
    if (response.statusCode == 200) {
      Get.snackbar('Success', 'File Uploaded...',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
      selectedImagePath.value = '';
      selectedImageSize.value = '';
      isLoading.value = false;
    } else {
      Get.snackbar('Error', 'File Upload Failed...',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
      isLoading.value = false;
    }
    fetchBasicDetail(RegistrationId.toString());
    Get.toNamed(Routes.aadharimage);
  }

  SetRegistrationId(String RegistrationIds) {
    RegistrationId(RegistrationIds);
  }

  SetProfilePhotoImage_new(String ProfilePhotoImages) {
    ProfilePhotoImage_new(ProfilePhotoImages);
  }

  SetProfilePhotoImage(String ProfilePhotoImages) {
    ProfilePhotoImage(ProfilePhotoImages);
  }

  SetFullSizePhoto_new(String FullSizePhotos) {
    FullSizePhoto_new(FullSizePhotos);
  }

  SetFullSizePhoto(String FullSizePhotos) {
    FullSizePhoto(FullSizePhotos);
  }

  SetAadharCardImage(String AadharCardImages) {
    AadharCardImage(AadharCardImages);
  }

  SetAadharCardImage_new(String AadharCardImage_news) {
    AadharCardImage_new(AadharCardImage_news);
  }

  DeleteProfilePhoto(String RegistrationId) async {
    try {
      final body = {'MemberId': RegistrationId.toString()};
      var response = await dio.post(URLs.delete_profile_image,
          data: body, options: Options(headers: _setHeaders()));
      if (response.statusCode == 200) {
        //Get.back();
        Get.snackbar("Success", "Profile Photo Deleted Successfully....",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.greenAccent,
            colorText: Colors.white);
      } else {
        Get.snackbar("Error", "Problem in Profile Photo Deleted....",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white);
      }
    } catch (e) {
      print(e.toString());
      Get.snackbar("Error", e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    } finally {
      fetchBasicDetail(RegistrationId.toString());
    }
  }

  DeleteFullSizePhoto(String RegistrationId) async {
    try {
      final body = {'MemberId': RegistrationId.toString()};
      var response = await dio.post(URLs.delete_fullsize_image,
          data: body, options: Options(headers: _setHeaders()));
      if (response.statusCode == 200) {
        //Get.back();
        Get.snackbar(
            "Success", "Profile Full Size Photo Deleted Successfully....",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.greenAccent,
            colorText: Colors.white);
      } else {
        Get.snackbar("Error", "Problem in Profile Full Size Photo Deleted....",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white);
      }
    } catch (e) {
      print(e.toString());
      Get.snackbar("Error", e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    } finally {
      fetchBasicDetail(RegistrationId.toString());
    }
  }

  DeleteAadharPhoto(String RegistrationId) async {
    try {
      final body = {'MemberId': RegistrationId.toString()};
      var response = await dio.post(URLs.delete_aadhar_image,
          data: body, options: Options(headers: _setHeaders()));
      if (response.statusCode == 200) {
        //Get.back();
        Get.snackbar("Success", "Aadhar Photo Deleted Successfully....",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.greenAccent,
            colorText: Colors.white);
      } else {
        Get.snackbar("Error", "Problem in Aadhar Photo Deleted....",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white);
      }
    } catch (e) {
      print(e.toString());
      Get.snackbar("Error", e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    } finally {
      fetchBasicDetail(RegistrationId.toString());
    }
  }
}

_setHeaders() => {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Access-Control_Allow_Origin': '*'
    };
