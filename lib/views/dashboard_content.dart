import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kannada_devangar/controller/home_controller.dart';
import 'package:kannada_devangar/controller/member_detail_controller.dart';
import 'package:kannada_devangar/controller/orderdetail_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

var formatter = new DateFormat('dd-MM-yyyy');

_formatDate(DateTime date) {
  if (date != null) {
    return formatter.format(date);
  } else {
    return 'NA';
  }
}

class DashboardContent extends StatefulWidget {
  @override
  _DashboardContentState createState() => _DashboardContentState();
}

class _DashboardContentState extends State<DashboardContent> {
  final OrderDetailController odController = Get.put(OrderDetailController());
  final MemberDetailController mController = Get.put(MemberDetailController());
  final HomeController hController = Get.put(HomeController());
  SharedPreferences sharedPreferences;
  String MemberName = "";
  String RegistrationId = "";
  String ProfilePhoto1 = "";
  String ProfilePhoto2 = "";
  String RegCode = "";
  int ProfileCount = 5;

  List users = [];
  bool isLoading = false;

  static Dio dio = new Dio();

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      RegistrationId = sharedPreferences.getString("RegistrationId").toString();
      MemberName = sharedPreferences.getString("MemberName").toString();
      ProfilePhoto1 = sharedPreferences.getString("ProfilePhoto1").toString();
      ProfilePhoto2 = sharedPreferences.getString("ProfilePhoto2").toString();
      RegCode = sharedPreferences.getString("RegCode").toString();
      //odController.fetchBasicDetail(RegistrationId);
      //mController.fetchBasicDetail(RegistrationId);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLoginStatus();
  }

  @override
  Widget build(BuildContext context) {
    //odController.fetchUnlockedProfileList(RegistrationId, 5);
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              children: [
                odController.OrderMsg.toString() != ""
                    ? Obx(
                        () => odController.isLoading.value == true
                            ? Expanded(
                                child:
                                    Center(child: CircularProgressIndicator()))
                            : Text(
                                odController.OrderMsg.toString(),
                                style: TextStyle(
                                    fontSize: 25.0,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ),
                      )
                    : Text(''),
                Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Text(
                      MemberName.toString(),
                      style: TextStyle(
                          color: Colors.purple,
                          fontWeight: FontWeight.w700,
                          fontSize: 20.0),
                    ),
                  ),
                ),
                Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        new Text(
                          "Order Date",
                          style: (TextStyle(color: Colors.purple)),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Obx(
                          () => odController.isLoading.value == true
                              ? Expanded(
                                  child: Center(
                                      child: CircularProgressIndicator()))
                              : Text(
                                  _formatDate(DateTime.parse(
                                      odController.OrderDate.toString())),
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.purple,
                                      fontWeight: FontWeight.bold),
                                ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        new Text(
                          "Remaining Days",
                          style: (TextStyle(color: Colors.purple)),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Obx(
                          () => odController.isLoading.value == true
                              ? Expanded(
                                  child: Center(
                                      child: CircularProgressIndicator()))
                              : Text(
                                  odController.RemDays.value,
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.purple,
                                      fontWeight: FontWeight.bold),
                                ),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        new Text(
                          "Package Name",
                          style: (TextStyle(color: Colors.purple)),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Obx(
                          () => odController.isLoading.value == true
                              ? Expanded(
                                  child: Center(
                                      child: CircularProgressIndicator()))
                              : Text(
                                  odController.PackageName.value,
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.purple,
                                      fontWeight: FontWeight.bold),
                                ),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        new Text(
                          "Profile Count",
                          style: (TextStyle(color: Colors.purple)),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Obx(
                          () => odController.isLoading.value == true
                              ? Expanded(
                                  child: Center(
                                      child: CircularProgressIndicator()))
                              : Text(
                                  odController.ProfileCount.value,
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.purple,
                                      fontWeight: FontWeight.bold),
                                ),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        new Text(
                          "Viewed Count",
                          style: (TextStyle(color: Colors.purple)),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Obx(
                          () => odController.isLoading.value == true
                              ? Expanded(
                                  child: Center(
                                      child: CircularProgressIndicator()))
                              : Text(
                                  odController.ViewedProfileCount.value,
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.purple,
                                      fontWeight: FontWeight.bold),
                                ),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        new Text(
                          "Balance Count",
                          style: (TextStyle(color: Colors.purple)),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Obx(
                          () => odController.isLoading.value == true
                              ? Expanded(
                                  child: Center(
                                      child: CircularProgressIndicator()))
                              : Text(
                                  odController.BalViewCount.value,
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.purple,
                                      fontWeight: FontWeight.bold),
                                ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
