import 'package:feedback/feedback.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kannada_devangar/controller/welcome_controller.dart';
import 'package:kannada_devangar/utility/app_pages.dart';
import 'package:kannada_devangar/utility/app_theme.dart';
import 'package:kannada_devangar/utility/initial_binding.dart';
import 'package:kannada_devangar/utility/permissions.dart';
import 'core/initial_binding.dart';

Future<void> initServices() async {
  Permissions.checkCameraPermission();
  Permissions.checkStoragePermission();
}

void main() async {
  Get.testMode = true;
  await GetStorage.init('dmic');
  Get.put(Welcome_Controller());
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(BetterFeedback(
      mode: FeedbackMode.navigate,
      child: GetMaterialApp(
        smartManagement: SmartManagement.full,
        initialBinding: InitialBinding(),
        title: 'Kannada Devanga MIC',
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.rightToLeft,
        getPages: AppPages.routes,
        initialRoute: '/welcomeView',
        theme: appThemeData,
      )));
}
