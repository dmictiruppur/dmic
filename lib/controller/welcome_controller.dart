import 'package:get/get.dart';
import 'package:kannada_devangar/core/urls.dart';
import 'package:package_info/package_info.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class Welcome_Controller extends GetxController {
  static Welcome_Controller get to => Get.find();
  RxString appName = "".obs;
  RxString packageName = "".obs;
  RxString version = "".obs;
  RxString buildNumber = "".obs;
  RxString NewVerNumber = "".obs;

  static Dio dio = new Dio();

  @override
  void onInit() async {
    // TODO: implement onInit
    //GetPackageInfo();
    //GetCurrentVersionNumber();
    super.onInit();
  }

  GetPackageInfo() async{
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    appName.value = packageInfo.appName;
    packageName.value = packageInfo.packageName;
    version.value = packageInfo.version;
    buildNumber.value = packageInfo.buildNumber;
  }

  GetCurrentVersionNumber() async{
    print("Stest");
    var res1 = await dio.get(URLs.get_version);
    print("No Output = " + res1.data);

    var res2 = await http.get(Uri.parse(URLs.get_version));
    print("No Output = " + res2.body);
  }
}