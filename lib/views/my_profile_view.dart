import 'dart:core';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kannada_devangar/controller/myprofile_controller.dart';
import 'package:kannada_devangar/core/open_url.dart';
import 'package:kannada_devangar/core/urls.dart';
import 'package:kannada_devangar/utility/app_drawer.dart';
import 'package:kannada_devangar/widget/profile_edit_page.dart';

class MyProfileView extends GetView<MyProfileController> {
  final MyProfileController mProfile = Get.put(MyProfileController());

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile View'),
        /*actions: [
          IconButton(onPressed: () {
            Get.to(MyProfileViewEdit());
          }, icon: Icon(Icons.edit))
        ],*/
      ),
      drawer: AppDrawer(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: Obx(
                () => mProfile.isLoading.value == true
                    ? Expanded(
                        child: Center(child: CircularProgressIndicator()))
                    : ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: mProfile.smdetail_list.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Card(
                                child: Column(
                                  children: [
                                    Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              mProfile.smdetail_list[index]
                                                  .memberNameEn
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.purple,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20.0),
                                            ),
                                            SizedBox(
                                              width: 20,
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
                                                OpenUrl().launchURL(
                                                    'http://dmic.in/member');
                                              },
                                              child: Icon(
                                                Icons.edit,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          mProfile.smdetail_list[index].regCode
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
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                (mProfile.smdetail_list[index]
                                                            .aboutMySelf
                                                            .toString() !=
                                                        "null")
                                                    ? Text(
                                                        mProfile
                                                            .smdetail_list[
                                                                index]
                                                            .aboutMySelf
                                                            .toString(),
                                                        style: TextStyle(
                                                            color:
                                                                Colors.purple,
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
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    MemberRowDetail(
                                                        "Profile Created By",
                                                        mProfile
                                                            .smdetail_list[
                                                                index]
                                                            .profileCreatedForEn
                                                            .toString()),
                                                    Divider(
                                                      thickness: 0.5,
                                                      color: Colors.purple,
                                                    ),
                                                    MemberRowDetail(
                                                        "Age",
                                                        mProfile
                                                            .smdetail_list[
                                                                index]
                                                            .age
                                                            .toString()),
                                                    Divider(
                                                      thickness: 0.5,
                                                      color: Colors.purple,
                                                    ),
                                                    MemberRowDetail(
                                                        "Mother Tongue",
                                                        mProfile
                                                            .smdetail_list[
                                                                index]
                                                            .motherToungTitleTa
                                                            .toString()),
                                                    Divider(
                                                      thickness: 0.5,
                                                      color: Colors.purple,
                                                    ),
                                                    MemberRowDetail(
                                                        "Marital Status",
                                                        mProfile
                                                            .smdetail_list[
                                                                index]
                                                            .maritalStatusTitleEn
                                                            .toString()),
                                                    Divider(
                                                      thickness: 0.5,
                                                      color: Colors.purple,
                                                    ),
                                                    MemberRowDetail(
                                                        "Height",
                                                        mProfile
                                                            .smdetail_list[
                                                                index]
                                                            .heightTitleEn
                                                            .toString()),
                                                    Divider(
                                                      thickness: 0.5,
                                                      color: Colors.purple,
                                                    ),
                                                    MemberRowDetail(
                                                        "Weight",
                                                        mProfile
                                                            .smdetail_list[
                                                                index]
                                                            .weightInKgs
                                                            .toString()),
                                                    Divider(
                                                      thickness: 0.5,
                                                      color: Colors.purple,
                                                    ),
                                                    MemberRowDetail(
                                                        "Country",
                                                        mProfile
                                                            .smdetail_list[
                                                                index]
                                                            .countryNameEn
                                                            .toString()),
                                                    Divider(
                                                      thickness: 0.5,
                                                      color: Colors.purple,
                                                    ),
                                                    MemberRowDetail(
                                                        "State",
                                                        mProfile
                                                            .smdetail_list[
                                                                index]
                                                            .stateNameEn
                                                            .toString()),
                                                    Divider(
                                                      thickness: 0.5,
                                                      color: Colors.purple,
                                                    ),
                                                    MemberRowDetail(
                                                        "City",
                                                        mProfile
                                                            .smdetail_list[
                                                                index]
                                                            .cityNameEn
                                                            .toString()),
                                                    Divider(
                                                      thickness: 0.5,
                                                      color: Colors.purple,
                                                    ),
                                                    MemberRowDetail(
                                                        "Mobile No",
                                                        mProfile
                                                            .smdetail_list[
                                                                index]
                                                            .regMobileNo
                                                            .toString()),
                                                    Divider(
                                                      thickness: 0.5,
                                                      color: Colors.purple,
                                                    ),
                                                    MemberRowDetail(
                                                        "Alternate No",
                                                        mProfile
                                                            .smdetail_list[
                                                                index]
                                                            .alternateMobileNo
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
                                            "Religion",
                                            style: TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    MemberRowDetail(
                                                        "Kulam",
                                                        mProfile
                                                            .smdetail_list[
                                                                index]
                                                            .KolamTitle_en
                                                            .toString()),
                                                    Divider(
                                                      thickness: 0.5,
                                                      color: Colors.purple,
                                                    ),
                                                    MemberRowDetail(
                                                        "Gothram",
                                                        mProfile
                                                            .smdetail_list[
                                                                index]
                                                            .gothramTitleEn
                                                            .toString()),
                                                    Divider(
                                                      thickness: 0.5,
                                                      color: Colors.purple,
                                                    ),
                                                    MemberRowDetail(
                                                        "Raasi",
                                                        mProfile
                                                            .smdetail_list[
                                                                index]
                                                            .rasiMoonTitleEn
                                                            .toString()),
                                                    Divider(
                                                      thickness: 0.5,
                                                      color: Colors.purple,
                                                    ),
                                                    MemberRowDetail(
                                                        "Natchathira",
                                                        mProfile
                                                            .smdetail_list[
                                                                index]
                                                            .starProTitleEn
                                                            .toString()),
                                                    Divider(
                                                      thickness: 0.5,
                                                      color: Colors.purple,
                                                    ),
                                                    MemberRowDetail(
                                                        "Place Of Birth",
                                                        mProfile
                                                            .smdetail_list[
                                                                index]
                                                            .cityNameEn
                                                            .toString()),
                                                    Divider(
                                                      thickness: 0.5,
                                                      color: Colors.purple,
                                                    ),
                                                    MemberRowDetail(
                                                        "Date Of Birth",
                                                        mProfile
                                                            .smdetail_list[
                                                                index]
                                                            .mDob
                                                            .toString()),
                                                    Divider(
                                                      thickness: 0.5,
                                                      color: Colors.purple,
                                                    ),
                                                    MemberRowDetail(
                                                        "Time Of Birth",
                                                        mProfile
                                                            .smdetail_list[
                                                                index]
                                                            .timeOfBirth
                                                            .toString()),
                                                    Divider(
                                                      thickness: 0.5,
                                                      color: Colors.purple,
                                                    ),
                                                    MemberRowDetail(
                                                        "Sevvai Dosham",
                                                        mProfile
                                                            .smdetail_list[
                                                                index]
                                                            .isSevaiDhosam
                                                            .toString()),
                                                    Divider(
                                                      thickness: 0.5,
                                                      color: Colors.purple,
                                                    ),
                                                    MemberRowDetail(
                                                        "Ragu Kedhu",
                                                        mProfile
                                                            .smdetail_list[
                                                                index]
                                                            .isRaguKedhu
                                                            .toString()),
                                                    Divider(
                                                      thickness: 0.5,
                                                      color: Colors.purple,
                                                    ),
                                                    MemberRowDetail(
                                                        "Sutha jadhagam",
                                                        mProfile
                                                            .smdetail_list[
                                                                index]
                                                            .isSuthaJadhagam
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
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    MemberRowDetail(
                                                        "Education",
                                                        mProfile
                                                            .smdetail_list[
                                                                index]
                                                            .educationTitleEn
                                                            .toString()),
                                                    Divider(
                                                      thickness: 0.5,
                                                      color: Colors.purple,
                                                    ),
                                                    MemberRowDetail(
                                                        "Employeed In",
                                                        mProfile
                                                            .smdetail_list[
                                                                index]
                                                            .EmployeeInTitle_en
                                                            .toString()),
                                                    Divider(
                                                      thickness: 0.5,
                                                      color: Colors.purple,
                                                    ),
                                                    MemberRowDetail(
                                                        "Occupation",
                                                        mProfile
                                                            .smdetail_list[
                                                                index]
                                                            .professionalTitleEn
                                                            .toString()),
                                                    Divider(
                                                      thickness: 0.5,
                                                      color: Colors.purple,
                                                    ),
                                                    MemberRowDetail(
                                                        "Organizaion Name",
                                                        mProfile
                                                            .smdetail_list[
                                                                index]
                                                            .organizationName
                                                            .toString()),
                                                    Divider(
                                                      thickness: 0.5,
                                                      color: Colors.purple,
                                                    ),
                                                    MemberRowDetail(
                                                        "Salary / Annum",
                                                        mProfile
                                                            .smdetail_list[
                                                                index]
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
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    MemberRowDetail(
                                                        "Father Name",
                                                        mProfile
                                                            .smdetail_list[
                                                                index]
                                                            .fatherNameEn
                                                            .toString()),
                                                    Divider(
                                                      thickness: 0.5,
                                                      color: Colors.purple,
                                                    ),
                                                    MemberRowDetail(
                                                        "Father Kulam",
                                                        mProfile
                                                            .smdetail_list[
                                                                index]
                                                            .fKolamTitle_en
                                                            .toString()),
                                                    Divider(
                                                      thickness: 0.5,
                                                      color: Colors.purple,
                                                    ),
                                                    MemberRowDetail(
                                                        "Father Occupation",
                                                        mProfile
                                                            .smdetail_list[
                                                                index]
                                                            .fOccupationTitle_en
                                                            .toString()),
                                                    Divider(
                                                      thickness: 0.5,
                                                      color: Colors.purple,
                                                    ),
                                                    MemberRowDetail(
                                                        "Mothers Name",
                                                        mProfile
                                                            .smdetail_list[
                                                                index]
                                                            .motherNameEn
                                                            .toString()),
                                                    Divider(
                                                      thickness: 0.5,
                                                      color: Colors.purple,
                                                    ),
                                                    MemberRowDetail(
                                                        "Mother Kulam",
                                                        mProfile
                                                            .smdetail_list[
                                                                index]
                                                            .mKolamTitle_en
                                                            .toString()),
                                                    Divider(
                                                      thickness: 0.5,
                                                      color: Colors.purple,
                                                    ),
                                                    MemberRowDetail(
                                                        "Mother Occupation",
                                                        mProfile
                                                            .smdetail_list[
                                                                index]
                                                            .mOccupationTitle_en
                                                            .toString()),
                                                    Divider(
                                                      thickness: 0.5,
                                                      color: Colors.purple,
                                                    ),
                                                    MemberRowDetail(
                                                        "Brothers",
                                                        mProfile
                                                            .smdetail_list[
                                                                index]
                                                            .brotherCountId
                                                            .toString()),
                                                    Divider(
                                                      thickness: 0.5,
                                                      color: Colors.purple,
                                                    ),
                                                    MemberRowDetail(
                                                        "Married Brothers",
                                                        mProfile
                                                            .smdetail_list[
                                                                index]
                                                            .mbc_CountTitle
                                                            .toString()),
                                                    Divider(
                                                      thickness: 0.5,
                                                      color: Colors.purple,
                                                    ),
                                                    MemberRowDetail(
                                                        "Sisters",
                                                        mProfile
                                                            .smdetail_list[
                                                                index]
                                                            .sc_CountTitle
                                                            .toString()),
                                                    Divider(
                                                      thickness: 0.5,
                                                      color: Colors.purple,
                                                    ),
                                                    MemberRowDetail(
                                                        "Married Sisters",
                                                        mProfile
                                                            .smdetail_list[
                                                                index]
                                                            .msc_CountTitle
                                                            .toString()),
                                                    Divider(
                                                      thickness: 0.5,
                                                      color: Colors.purple,
                                                    ),
                                                    MemberRowDetail(
                                                        "Family Status",
                                                        mProfile
                                                            .smdetail_list[
                                                                index]
                                                            .FamilyStatusTitle_en
                                                            .toString()),
                                                    Divider(
                                                      thickness: 0.5,
                                                      color: Colors.purple,
                                                    ),
                                                    MemberRowDetail(
                                                        "Family Value",
                                                        mProfile
                                                            .smdetail_list[
                                                                index]
                                                            .FamilyValueTitle_ta
                                                            .toString()),
                                                    Divider(
                                                      thickness: 0.5,
                                                      color: Colors.purple,
                                                    ),
                                                    MemberRowDetail(
                                                        "Family Type",
                                                        mProfile
                                                            .smdetail_list[
                                                                index]
                                                            .FamilyTypeTitle_en
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
