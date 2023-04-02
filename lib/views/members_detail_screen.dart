import 'dart:core';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kannada_devangar/controller/order_controller.dart';
import 'package:kannada_devangar/controller/search_member_controller.dart';
import 'package:kannada_devangar/core/urls.dart';
import 'package:kannada_devangar/views/view_pdf.dart';
import 'package:url_launcher/url_launcher.dart';

var formatter = new DateFormat('dd-MM-yyyy');
var timeFormat = new DateFormat('hh:mm aa');
_formatDate(DateTime date) {
  if (date != null) {
    return formatter.format(date);
  } else {
    return 'NA';
  }
}

_formatTime(DateTime date) {
  if (date != null) {
    return timeFormat.format(date);
  } else {
    return 'NA';
  }
}

class MemberDetailScreen extends GetView<Search_Member_Controller> {
  final Search_Member_Controller _search_member_controller =
      Get.put(Search_Member_Controller());
  //final OrderController _orderController = Get.put(OrderController());

  String sRegistrationId;
  String mRegistrationId;
  String mOrderId;
  String mOrderDetailId;

  MemberDetailScreen(
      {this.sRegistrationId,
      this.mRegistrationId,
      this.mOrderId,
      this.mOrderDetailId});

  /* void onInit() {
    _search_member_controller.fetch_single_member_detail(this.mRegistrationId, this.sRegistrationId);
  }*/

  @override
  Widget build(BuildContext context) {
    //_search_member_controller.fetch_single_member_detail(this.mRegistrationId, this.sRegistrationId);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Member Detail Screen'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: Obx(
                () => ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: _search_member_controller.smdetail_list.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Card(
                            child: Column(
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(20.0),
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          width: 200.0,
                                          height: 200.0,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              /*image: DecorationImage(
                                                  image: int.parse(_search_member_controller
                                                              .smdetail_list[index]
                                                              .mProfileViewId
                                                              .toString()) >
                                                          0
                                                      ? _search_member_controller.smdetail_list[index].profilePhotoImage.toString() != "null"
                                                          ? NetworkImage(URLs.ImgUrl + "/" + _search_member_controller.smdetail_list[index].registrationId.toString() + "/" + _search_member_controller.smdetail_list[index].profilePhotoImage.toString())
                                                          : AssetImage('assets/images/no-image.jpg')
                                                      : AssetImage('assets/images/no-image.jpg'),
                                                  fit: BoxFit.cover),*/
                                              image: DecorationImage(
                                                  image: _search_member_controller
                                                              .smdetail_list[index]
                                                              .profilePhotoImage
                                                              .toString() !=
                                                          "null"
                                                      ? NetworkImage(URLs.ImgUrl + "/" + _search_member_controller.smdetail_list[index].registrationId.toString() + "/" + _search_member_controller.smdetail_list[index].profilePhotoImage.toString())
                                                      : AssetImage('assets/images/no-image.jpg'),
                                                  fit: BoxFit.cover),
                                              borderRadius: BorderRadius.all(Radius.circular(2.0)),
                                              boxShadow: [
                                                BoxShadow(
                                                    blurRadius: 1.0,
                                                    color: Colors.black)
                                              ]),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    int.parse(_search_member_controller
                                                .smdetail_list[index]
                                                .mProfileViewId
                                                .toString()) ==
                                            0
                                        ? ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              // Foreground color
                                              onPrimary: Colors.white,
                                              // Background color
                                              primary: Colors.purple,
                                            ).copyWith(
                                                elevation:
                                                    ButtonStyleButton.allOrNull(
                                                        0.0)),
                                            onPressed: () {
                                              _search_member_controller
                                                  .UnlockProfile(
                                                      mRegistrationId,
                                                      _search_member_controller
                                                          .smdetail_list[index]
                                                          .registrationId
                                                          .toString(),
                                                      mOrderId.toString(),
                                                      mOrderDetailId.toString(),
                                                      _search_member_controller
                                                          .smdetail_list[index]
                                                          .mProfileViewId
                                                          .toString());
                                            },
                                            child: Icon(
                                              Icons.lock_rounded,
                                              color: Colors.white,
                                            ),
                                          )
                                        : Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  // Foreground color
                                                  onPrimary: Colors.white,
                                                  // Background color
                                                  primary: Colors.purple,
                                                ).copyWith(
                                                    elevation: ButtonStyleButton
                                                        .allOrNull(0.0)),
                                                onPressed: () {
                                                  if (_search_member_controller
                                                          .smdetail_list[index]
                                                          .horoscopeDetail
                                                          .toString() !=
                                                      "null") {
                                                    _launchURL(URLs.ImgUrl +
                                                        "/" +
                                                        _search_member_controller
                                                            .smdetail_list[
                                                                index]
                                                            .registrationId
                                                            .toString() +
                                                        "/" +
                                                        _search_member_controller
                                                            .smdetail_list[
                                                                index]
                                                            .horoscopeDetail
                                                            .toString());
                                                    //ViewPdf(file: URLs.ImgUrl + "/" + _search_member_controller.smdetail_list[index].registrationId.toString() + "/" + _search_member_controller.smdetail_list[index].horoscopeDetail.toString());
                                                  } else {
                                                    Get.snackbar("Error",
                                                        "File Missing...",
                                                        snackPosition:
                                                            SnackPosition
                                                                .BOTTOM,
                                                        backgroundColor:
                                                            Colors.red,
                                                        colorText:
                                                            Colors.white);
                                                  }
                                                },
                                                child: Icon(
                                                  Icons.picture_as_pdf_rounded,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  // Foreground color
                                                  onPrimary: Colors.white,
                                                  // Background color
                                                  primary: Colors.purple,
                                                ).copyWith(
                                                    elevation: ButtonStyleButton
                                                        .allOrNull(0.0)),
                                                onPressed: () {
                                                  if (_search_member_controller
                                                          .smdetail_list[index]
                                                          .horoscopeDetail
                                                          .toString() !=
                                                      "null") {
                                                    _launchURL(URLs.ImgUrl +
                                                        "/" +
                                                        _search_member_controller
                                                            .smdetail_list[
                                                                index]
                                                            .registrationId
                                                            .toString() +
                                                        "/" +
                                                        _search_member_controller
                                                            .smdetail_list[
                                                                index]
                                                            .horoscopeDetail
                                                            .toString());
                                                    //ViewPdf(file: URLs.ImgUrl + "/" + _search_member_controller.smdetail_list[index].registrationId.toString() + "/" + _search_member_controller.smdetail_list[index].horoscopeDetail.toString());
                                                  } else {
                                                    Get.snackbar("Error",
                                                        "File Missing...",
                                                        snackPosition:
                                                            SnackPosition
                                                                .BOTTOM,
                                                        backgroundColor:
                                                            Colors.red,
                                                        colorText:
                                                            Colors.white);
                                                  }
                                                },
                                                child: Icon(
                                                  Icons.file_download,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                  ],
                                ),
                                SizedBox(height: 20.0),
                                Column(
                                  children: [
                                    Text(
                                      _search_member_controller
                                          .smdetail_list[index].memberNameEn
                                          .toString(),
                                      style: TextStyle(
                                          color: Colors.purple,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      _search_member_controller
                                          .smdetail_list[index].regCode
                                          .toString(),
                                      style: TextStyle(
                                          color: Colors.purple,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.0),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "About Me",
                                              style: TextStyle(
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            (_search_member_controller
                                                        .smdetail_list[index]
                                                        .AboutMySelf
                                                        .toString() !=
                                                    "null")
                                                ? Text(
                                                    _search_member_controller
                                                        .smdetail_list[index]
                                                        .AboutMySelf
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: Colors.purple,
                                                        fontSize: 12.0))
                                                : Text(".")
                                          ]),
                                    ),
                                    ExpansionTile(
                                      initiallyExpanded: false,
                                      title: Text(
                                        "Basic Details",
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                MemberRowDetail(
                                                    "Profile Created By",
                                                    _search_member_controller
                                                        .smdetail_list[index]
                                                        .profileCreatedForEn
                                                        .toString()),
                                                Divider(
                                                  thickness: 0.5,
                                                  color: Colors.purple,
                                                ),
                                                MemberRowDetail(
                                                    "Age",
                                                    _search_member_controller
                                                        .smdetail_list[index]
                                                        .age
                                                        .toString()),
                                                Divider(
                                                  thickness: 0.5,
                                                  color: Colors.purple,
                                                ),
                                                MemberRowDetail(
                                                    "Mother Tongue",
                                                    _search_member_controller
                                                        .smdetail_list[index]
                                                        .motherToungTitleEn
                                                        .toString()),
                                                Divider(
                                                  thickness: 0.5,
                                                  color: Colors.purple,
                                                ),
                                                MemberRowDetail(
                                                    "Marital Status",
                                                    _search_member_controller
                                                        .smdetail_list[index]
                                                        .maritalStatusTitleEn
                                                        .toString()),
                                                Divider(
                                                  thickness: 0.5,
                                                  color: Colors.purple,
                                                ),
                                                MemberRowDetail(
                                                    "Height",
                                                    _search_member_controller
                                                        .smdetail_list[index]
                                                        .heightTitleEn
                                                        .toString()),
                                                Divider(
                                                  thickness: 0.5,
                                                  color: Colors.purple,
                                                ),
                                                MemberRowDetail(
                                                    "Weight",
                                                    _search_member_controller
                                                        .smdetail_list[index]
                                                        .weightInKgs
                                                        .toString()),
                                                Divider(
                                                  thickness: 0.5,
                                                  color: Colors.purple,
                                                ),
                                                MemberRowDetail(
                                                    "Country",
                                                    _search_member_controller
                                                        .smdetail_list[index]
                                                        .countryNameEn
                                                        .toString()),
                                                Divider(
                                                  thickness: 0.5,
                                                  color: Colors.purple,
                                                ),
                                                MemberRowDetail(
                                                    "State",
                                                    _search_member_controller
                                                        .smdetail_list[index]
                                                        .stateNameEn
                                                        .toString()),
                                                Divider(
                                                  thickness: 0.5,
                                                  color: Colors.purple,
                                                ),
                                                MemberRowDetail(
                                                    "City",
                                                    _search_member_controller
                                                        .smdetail_list[index]
                                                        .cityNameEn
                                                        .toString()),
                                                Divider(
                                                  thickness: 0.5,
                                                  color: Colors.purple,
                                                ),
                                                MemberRowDetail(
                                                    "Mobile No", ""),
                                                Divider(
                                                  thickness: 0.5,
                                                  color: Colors.purple,
                                                ),
                                                MemberRowDetail(
                                                    "Alternate No", ""),
                                                Divider(
                                                  thickness: 0.5,
                                                  color: Colors.purple,
                                                ),
                                              ]),
                                        ),
                                      ],
                                    ),
                                    ExpansionTile(
                                      initiallyExpanded: false,
                                      title: Text(
                                        "Religion",
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                MemberRowDetail(
                                                    "Kulam",
                                                    _search_member_controller
                                                        .smdetail_list[index]
                                                        .kolamTitleEn
                                                        .toString()),
                                                Divider(
                                                  thickness: 0.5,
                                                  color: Colors.purple,
                                                ),
                                                MemberRowDetail(
                                                    "Gothram",
                                                    _search_member_controller
                                                        .smdetail_list[index]
                                                        .gothramTitleEn
                                                        .toString()),
                                                Divider(
                                                  thickness: 0.5,
                                                  color: Colors.purple,
                                                ),
                                                MemberRowDetail(
                                                    "Raasi",
                                                    _search_member_controller
                                                        .smdetail_list[index]
                                                        .rasiMoonTitleEn
                                                        .toString()),
                                                Divider(
                                                  thickness: 0.5,
                                                  color: Colors.purple,
                                                ),
                                                MemberRowDetail(
                                                    "Natchathira",
                                                    _search_member_controller
                                                        .smdetail_list[index]
                                                        .starProTitleEn
                                                        .toString()),
                                                Divider(
                                                  thickness: 0.5,
                                                  color: Colors.purple,
                                                ),
                                                MemberRowDetail(
                                                    "Place Of Birth",
                                                    _search_member_controller
                                                        .smdetail_list[index]
                                                        .cityNameEn
                                                        .toString()),
                                                Divider(
                                                  thickness: 0.5,
                                                  color: Colors.purple,
                                                ),
                                                MemberRowDetail(
                                                    "Date Of Birth",
                                                    _search_member_controller
                                                                .smdetail_list[
                                                                    index]
                                                                .mDob
                                                                .toString() !=
                                                            "null"
                                                        ? _formatDate(DateTime.parse(
                                                            _search_member_controller
                                                                .smdetail_list[
                                                                    index]
                                                                .mDob
                                                                .toString()))
                                                        : ""),
                                                Divider(
                                                  thickness: 0.5,
                                                  color: Colors.purple,
                                                ),
                                                MemberRowDetail(
                                                    "Time Of Birth",
                                                    _search_member_controller
                                                        .smdetail_list[index]
                                                        .timeOfBirth
                                                        .toString()),
                                                Divider(
                                                  thickness: 0.5,
                                                  color: Colors.purple,
                                                ),
                                                MemberRowDetail(
                                                    "Sevvai Dosham",
                                                    _search_member_controller
                                                        .smdetail_list[index]
                                                        .sevaiDhosam
                                                        .toString()),
                                                Divider(
                                                  thickness: 0.5,
                                                  color: Colors.purple,
                                                ),
                                                MemberRowDetail(
                                                    "Ragu Kedhu",
                                                    _search_member_controller
                                                        .smdetail_list[index]
                                                        .raguKedhu
                                                        .toString()),
                                                Divider(
                                                  thickness: 0.5,
                                                  color: Colors.purple,
                                                ),
                                                MemberRowDetail(
                                                    "Sutha jadhagam",
                                                    _search_member_controller
                                                        .smdetail_list[index]
                                                        .suthaJadhagam
                                                        .toString()),
                                                Divider(
                                                  thickness: 0.5,
                                                  color: Colors.purple,
                                                ),
                                              ]),
                                        ),
                                      ],
                                    ),
                                    ExpansionTile(
                                      initiallyExpanded: false,
                                      title: Text(
                                        "Professional",
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                MemberRowDetail(
                                                    "Education",
                                                    _search_member_controller
                                                        .smdetail_list[index]
                                                        .educationTitleEn
                                                        .toString()),
                                                Divider(
                                                  thickness: 0.5,
                                                  color: Colors.purple,
                                                ),
                                                MemberRowDetail(
                                                    "Employeed In",
                                                    _search_member_controller
                                                        .smdetail_list[index]
                                                        .employeeInTitleEn
                                                        .toString()),
                                                Divider(
                                                  thickness: 0.5,
                                                  color: Colors.purple,
                                                ),
                                                MemberRowDetail(
                                                    "Occupation",
                                                    _search_member_controller
                                                        .smdetail_list[index]
                                                        .professionalTitleEn
                                                        .toString()),
                                                Divider(
                                                  thickness: 0.5,
                                                  color: Colors.purple,
                                                ),
                                                MemberRowDetail(
                                                    "Organizaion Name",
                                                    _search_member_controller
                                                        .smdetail_list[index]
                                                        .organizationName
                                                        .toString()),
                                                Divider(
                                                  thickness: 0.5,
                                                  color: Colors.purple,
                                                ),
                                                MemberRowDetail(
                                                    "Salary / Annum",
                                                    _search_member_controller
                                                        .smdetail_list[index]
                                                        .salaryPerAnnumInRs
                                                        .toString()),
                                                Divider(
                                                  thickness: 0.5,
                                                  color: Colors.purple,
                                                ),
                                              ]),
                                        ),
                                      ],
                                    ),
                                    ExpansionTile(
                                      initiallyExpanded: false,
                                      title: Text(
                                        "Family Detail",
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                MemberRowDetail(
                                                    "Father Name",
                                                    _search_member_controller
                                                        .smdetail_list[index]
                                                        .fatherNameEn
                                                        .toString()),
                                                Divider(
                                                  thickness: 0.5,
                                                  color: Colors.purple,
                                                ),
                                                MemberRowDetail(
                                                    "Father Kulam",
                                                    _search_member_controller
                                                        .smdetail_list[index]
                                                        .fKolamTitleEn
                                                        .toString()),
                                                Divider(
                                                  thickness: 0.5,
                                                  color: Colors.purple,
                                                ),
                                                MemberRowDetail(
                                                    "Father Occupation",
                                                    _search_member_controller
                                                        .smdetail_list[index]
                                                        .fOccupationTitleEn
                                                        .toString()),
                                                Divider(
                                                  thickness: 0.5,
                                                  color: Colors.purple,
                                                ),
                                                MemberRowDetail(
                                                    "Mothers Name",
                                                    _search_member_controller
                                                        .smdetail_list[index]
                                                        .motherNameEn
                                                        .toString()),
                                                Divider(
                                                  thickness: 0.5,
                                                  color: Colors.purple,
                                                ),
                                                MemberRowDetail(
                                                    "Mother Kulam",
                                                    _search_member_controller
                                                        .smdetail_list[index]
                                                        .mKolamTitleEn
                                                        .toString()),
                                                Divider(
                                                  thickness: 0.5,
                                                  color: Colors.purple,
                                                ),
                                                MemberRowDetail(
                                                    "Mother Occupation",
                                                    _search_member_controller
                                                        .smdetail_list[index]
                                                        .mOccupationTitleEn
                                                        .toString()),
                                                Divider(
                                                  thickness: 0.5,
                                                  color: Colors.purple,
                                                ),
                                                MemberRowDetail(
                                                    "Brothers",
                                                    _search_member_controller
                                                        .smdetail_list[index]
                                                        .brotherSisterCountTitle
                                                        .toString()),
                                                Divider(
                                                  thickness: 0.5,
                                                  color: Colors.purple,
                                                ),
                                                MemberRowDetail(
                                                    "Married Brothers",
                                                    _search_member_controller
                                                        .smdetail_list[index]
                                                        .mbcCountTitle
                                                        .toString()),
                                                Divider(
                                                  thickness: 0.5,
                                                  color: Colors.purple,
                                                ),
                                                MemberRowDetail(
                                                    "Sisters",
                                                    _search_member_controller
                                                        .smdetail_list[index]
                                                        .scCountTitle
                                                        .toString()),
                                                Divider(
                                                  thickness: 0.5,
                                                  color: Colors.purple,
                                                ),
                                                MemberRowDetail(
                                                    "Married Sisters",
                                                    _search_member_controller
                                                        .smdetail_list[index]
                                                        .mscCountTitle
                                                        .toString()),
                                                Divider(
                                                  thickness: 0.5,
                                                  color: Colors.purple,
                                                ),
                                                MemberRowDetail(
                                                    "Family Status",
                                                    _search_member_controller
                                                        .smdetail_list[index]
                                                        .familyStatusTitleEn
                                                        .toString()),
                                                Divider(
                                                  thickness: 0.5,
                                                  color: Colors.purple,
                                                ),
                                                MemberRowDetail(
                                                    "Family Value",
                                                    _search_member_controller
                                                        .smdetail_list[index]
                                                        .familyValueTitleTa
                                                        .toString()),
                                                Divider(
                                                  thickness: 0.5,
                                                  color: Colors.purple,
                                                ),
                                                MemberRowDetail(
                                                    "Family Type",
                                                    _search_member_controller
                                                        .smdetail_list[index]
                                                        .familyTypeTitleEn
                                                        .toString()),
                                                Divider(
                                                  thickness: 0.5,
                                                  color: Colors.purple,
                                                ),
                                              ]),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }),
              ),
            ),
            /*Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Container(
                    child: RaisedButton(
                      onPressed: () {
                        //_orderController.UnlockProfile("4241",sRegistrationId,"4180","4178");
                        _search_member_controller.UnlockProfile("4241",sRegistrationId,"4180","4178");
                      },
                      child: Icon(Icons.remove_red_eye,
                        color:
                        Colors.white,
                      ),
                      color: Colors
                          .deepPurple,
                    ),
                    ),
                ],
              ),
            ),
            RaisedButton(
              onPressed: () {
                _search_member_controller.fetch_Orderdetail_new('4241');
              },
              child: Text('View Order Details'),
            ),
            RaisedButton(
              onPressed: () {
                _search_member_controller.fetch_single_member_detail(this.mRegistrationId, this.sRegistrationId);
              },
              child: Text('Fetch Single Member Detail'),
            ),
            SizedBox(height: 20,),*/
            /*Obx(() => Text(
              _search_member_controller.smdetail_list_new.mProfileViewId.toString() != null ? _search_member_controller.smdetail_list_new.mProfileViewId.toString() : 0,
            ),
            ),*/
            /*SizedBox(height: 20,),
            Obx(() => Text(
              _search_member_controller.OrderId.toString(),
            ),
            ),
            Obx(() => Text(
              _search_member_controller.OrderDetailId.toString(),
            ),
            ),
            Obx(() => Text(
              _search_member_controller.BalViewCount.toString(),
            ),
            ),*/
          ],
        ),
      ),
    );
  }

  Row MemberRowDetail(String LeftData, String RightData) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(LeftData),
        Text(
          RightData,
          style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

_launchURL(String Urls) async {
  String url = Urls.toString();
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
