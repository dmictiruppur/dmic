import 'dart:core';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kannada_devangar/components/rounded_input.dart';
import 'package:kannada_devangar/controller/myprofile_edit_controller.dart';
import 'package:kannada_devangar/core/open_url.dart';
import 'package:kannada_devangar/core/urls.dart';
import 'package:kannada_devangar/models/member_profile_view_model.dart';
import 'package:kannada_devangar/utility/app_drawer.dart';

class MyProfileViewEdit extends GetView<MyProfileEditController> {
  final MyProfileEditController mProfileedit = Get.put(MyProfileEditController());
  //MemberProfileViewModel mViewEdit;
  //TextEditingController _txt_AboutUs = TextEditingController();
  //MyProfileViewEdit({Key key, this.mViewEdit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    /*Future.delayed(Duration.zero, () {
      print(mProfileedit.txt_AboutMySelf.value);
      _txt_AboutUs.text = mProfileedit.txt_AboutMySelf.value;
    });*/
    //_txt_AboutUs.text = mProfileedit.txt_AboutMySelf.value;
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile Edit'),
        backgroundColor: Colors.red,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.save))
        ],
      ),
      //drawer: AppDrawer(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(mProfileedit.txt_AboutMySelf.value),
            //Text(mProfileedit.smdetail_list[0].aboutMySelf),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "About Me",
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 20,),
                    TextFormField(
                      keyboardType: TextInputType.multiline,
                      minLines: 1,
                      maxLines: 5,
                      /*onChanged: (value) {
                        mProfileedit.txt_AboutMySelf.value = value;
                      },*/
                    ),
                    RoundedInputOnChange(
                      hintText: mProfileedit.txt_AboutMySelf.value,
                      onChange: (value) => mProfileedit.txt_AboutMySelf(value),
                    ),
                    IconButton(onPressed: () {mProfileedit.SaveProfileEdit();}, icon: Icon(Icons.refresh)),
                  ]
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
        Text(RightData, style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),),
      ],
    );
  }

}