import 'dart:core';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kannada_devangar/controller/order_controller.dart';
import 'package:kannada_devangar/controller/search_controller.dart';
import 'package:kannada_devangar/controller/search_member_controller.dart';
import 'package:dio/dio.dart';
import 'package:kannada_devangar/core/urls.dart';

class MemberDetailScreen_old extends GetView<Search_Member_Controller> {
  final Search_Member_Controller _search_member_controller =
      Get.put(Search_Member_Controller());
  final OrderController _orderController = Get.put(OrderController());

  String sRegistrationId;
  String mRegistrationId;
  String mOrderId;
  String mOrderDetailId;

  MemberDetailScreen_old(
      {this.sRegistrationId,
      this.mRegistrationId,
      this.mOrderId,
      this.mOrderDetailId});

  @override
  void onInit() {
    //_search_member_controller.fetch_single_member_detail(this.mRegistrationId, this.sRegistrationId);
  }

  @override
  Widget build(BuildContext context) {
    //_search_member_controller.fetch_single_member_detail(mRegistrationId, sRegistrationId);
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
              child: GetBuilder<Search_Member_Controller>(initState: (state) {
                Get.find<Search_Member_Controller>().fetch_single_member_detail(
                    _search_member_controller.RegistrationId.toString(),
                    _search_member_controller.sRegistrationId.toString(),
                    "0",
                    "0");
              }, builder: (_) {
                return _.isLoading == true
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: _.smdetail_list.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Card(
                                child: Column(
                                  children: [
                                    int.parse(_.smdetail_list[index]
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
                                                      "4241",
                                                      _.smdetail_list[index]
                                                          .registrationId
                                                          .toString(),
                                                      "4180",
                                                      "4178",
                                                      _.smdetail_list[index]
                                                          .mProfileViewId
                                                          .toString());
                                            },
                                            child: Icon(
                                              Icons.lock_rounded,
                                              color: Colors.white,
                                            ),
                                          )
                                        : Row(
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
                                                onPressed: () {},
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
                                                onPressed: () {},
                                                child: Icon(
                                                  Icons.file_download,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
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
                                                  image: DecorationImage(
                                                      image: int.parse(_
                                                                  .smdetail_list[
                                                                      index]
                                                                  .mProfileViewId
                                                                  .toString()) >
                                                              0
                                                          ? _.smdetail_list[index].profilePhotoImage.toString() != "null"
                                                              ? NetworkImage(URLs.ImgUrl + "/" + _.smdetail_list[index].registrationId.toString() + "/" + _.smdetail_list[index].profilePhotoImage.toString())
                                                              : AssetImage('images/no-image.jpg')
                                                          : AssetImage('images/no-image.jpg'),
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
                                    SizedBox(height: 20.0),
                                  ],
                                ),
                              ),
                            ],
                          );
                        });
              }),
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
