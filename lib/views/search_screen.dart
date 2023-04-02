import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kannada_devangar/components/appbar_title.dart';
import 'package:kannada_devangar/components/rounded_input.dart';
import 'package:kannada_devangar/controller/home_controller.dart';
import 'package:kannada_devangar/controller/search_controller.dart';
import 'package:kannada_devangar/controller/search_member_controller.dart';
import 'package:kannada_devangar/core/colors.dart';
import 'package:kannada_devangar/utility/app_drawer.dart';
import 'package:kannada_devangar/views/search_detail_screen.dart';
import 'package:kannada_devangar/widget/kulam_dropdown.dart';
import 'package:kannada_devangar/widget/maritual_status_dropdown.dart';
import 'package:kannada_devangar/widget/raasi_dropdown.dart';
import 'package:kannada_devangar/widget/star_dropdown.dart';
import 'package:kannada_devangar/widget/thavir_kulam_dropdown.dart';

var formatter = new DateFormat('dd-MM-yyyy');

_formatDate(DateTime date) {
  if (date != null) {
    return formatter.format(date);
  } else {
    return 'NA';
  }
}

class Search_Screen extends StatefulWidget {
  /*Search_Screen({Key key, this.pageTitle}) : super(key: key);*/

  @override
  _Search_ScreenState createState() => _Search_ScreenState();
}

class _Search_ScreenState extends State<Search_Screen> {
  final Search_Controller sController = Get.put(Search_Controller());
  final Search_Member_Controller _search_member_controller =
      Get.put(Search_Member_Controller());
  final HomeController hController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new AppBarTitle("Search"),
        backgroundColor: TassistMenuBg,
      ),
      drawer: AppDrawer(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      ListView(
                        scrollDirection: Axis.vertical,
                        physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                      width: 100.0, child: Text('Register No')),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    width: 200.0,
                                    child: Obx(
                                      () => RoundedInputOnChange(
                                        hintText: sController.sRegCode.value,
                                        onChange: (value) =>
                                            sController.SetsRegCode(value),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          width: 100.0,
                                          child: Text('Age From')),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Container(
                                          width: 100.0, child: Text('Age To')),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 100.0,
                                        child: Obx(
                                          () => RoundedInputOnChange(
                                            hintText: sController.AgeFrom.value,
                                            onChange: (value) =>
                                                sController.SetAgeFrom(value),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Container(
                                        width: 100.0,
                                        child: Obx(
                                          () => RoundedInputOnChange(
                                            hintText: sController.AgeTo.value,
                                            onChange: (value) =>
                                                sController.SetAgeTo(
                                              (value),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                          width: 150.0,
                                          child: Text('Sevai Dhosam')),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Container(
                                        width: 60.0,
                                        child: Obx(
                                          () => Switch(
                                            onChanged: (value) =>
                                                sController.SetIsSevaiDhosam(
                                                    value),
                                            activeColor: Colors.purple,
                                            value:
                                                sController.IsSevaiDhosam.value,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                          width: 150.0,
                                          child: Text('Raagu Kedhu')),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Container(
                                        width: 60.0,
                                        child: Obx(
                                          () => Switch(
                                            onChanged: (value) =>
                                                sController.SetIsRaaguKedhu(
                                                    value),
                                            activeColor: Colors.purple,
                                            value:
                                                sController.IsRaaguKedhu.value,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                          width: 150.0,
                                          child: Text('Sutha Jadhagam')),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Container(
                                        width: 60.0,
                                        child: Obx(
                                          () => Switch(
                                            onChanged: (value) =>
                                                sController.SetIsSuthaJadhagam(
                                                    value),
                                            activeColor: Colors.purple,
                                            value: sController
                                                .IsSuthaJadhagam.value,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text('Maritual Status'),
                              SizedBox(
                                height: 10.0,
                              ),
                              MaritualStatus_DropDown(),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text('Kulam'),
                              SizedBox(
                                height: 10.0,
                              ),
                              Kulam_DropDown(),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text('Thavirkum Kulam'),
                              SizedBox(
                                height: 10.0,
                              ),
                              Thavirkum_Kulam_DropDown(),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text('Raasi'),
                              SizedBox(
                                height: 10.0,
                              ),
                              Raasi_DropDown(),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text('Natchathiram'),
                              SizedBox(
                                height: 10.0,
                              ),
                              Star_DropDown(),
                              SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                  margin: EdgeInsets.all(25),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      // Foreground color
                                      onPrimary: Colors.white,
                                      // Background color
                                      primary: Colors.purple,
                                    ).copyWith(
                                        elevation:
                                            ButtonStyleButton.allOrNull(0.0)),
                                    onPressed: () {
                                      //print("Testing");
                                      /*Get.to(SearchDetailScreen(
                                      AgeFrom: sController.AgeFrom.toString(),
                                      AgeTo: sController.AgeTo.toString(),
                                      sMaritalStatusId: sController.sMaritalStatusId.toString(),
                                      sKolamId: sController.sKolamId.toString(),
                                      sGothiramId: sController.sGothiramId.toString(),
                                      sThavirkumKolamId: sController.sThavirkumKolamId.toString(),
                                      sRaasiId: sController.sRaasiId.toString(),
                                      sNatchathiramId: sController.sNatchathiramId.toString(),
                                      IsSevaiDhosam: sController.IsSevaiDhosam.value,
                                      IsSuthaJadhagam: sController.IsSuthaJadhagam.value,
                                      IsRaaguKedhu: sController.IsRaaguKedhu.value,
                                      sRegCode: sController.sRegCode.value,
                                    ));*/

                                      _search_member_controller
                                          .AssignValueToObs(
                                              sController.AgeFrom.toString(),
                                              sController.AgeTo.toString(),
                                              sController.sMaritalStatusId
                                                  .toString(),
                                              sController.sKolamId.toString(),
                                              sController.sGothiramId
                                                  .toString(),
                                              sController.sRaasiId.toString(),
                                              sController.sNatchathiramId
                                                  .toString(),
                                              sController.sThavirkumKolamId
                                                  .toString(),
                                              sController.IsSevaiDhosam.value,
                                              sController.IsRaaguKedhu.value,
                                              sController.IsSuthaJadhagam.value,
                                              sController.sRegCode.toString());
                                    },
                                    child: Text('SEARCH'),
                                  )),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
