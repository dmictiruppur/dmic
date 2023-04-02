import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/member_detail_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProfile_FamilyDetail extends StatefulWidget {
  final String RegistrationId;

  MyProfile_FamilyDetail({this.RegistrationId});

  @override
  _MyProfile_FamilyDetailState createState() => _MyProfile_FamilyDetailState();
}

class _MyProfile_FamilyDetailState extends State<MyProfile_FamilyDetail> {
  final MemberDetailController mProfile = Get.put(MemberDetailController());
  SharedPreferences sharedPreferences;
  String RegistrationId = "";

  checkMemberDetail() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      RegistrationId = sharedPreferences.getString("RegistrationId").toString();
      //mProfile.fetchFamilyDetail(this.RegistrationId.toString());
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkMemberDetail();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  /*Icon(
                    Icons.edit,
                    color: Colors.green,
                  ),
                  SizedBox(
                    width: 8,
                  ),*/
                  Text(
                    "Family Detail",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Icon(
                Icons.edit,
                color: Colors.black,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Father Name",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                mProfile.FatherName_en.value.toString(),
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.purple,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Father Kulam",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                mProfile.fKolamTitle_en.value.toString(),
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.purple,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Father Occupation",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                mProfile.fOccupationTitle_en.value.toString(),
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.purple,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Mother Name",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                mProfile.MotherName_en.value.toString(),
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.purple,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Mother Kulam",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                mProfile.mKolamTitle_en.value.toString(),
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.purple,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Mother Occupation",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                mProfile.mOccupationTitle_en.value.toString(),
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.purple,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Brothers",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                mProfile.BrotherSisterCountTitle.value.toString(),
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.purple,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Married Brothers",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                mProfile.mbc_CountTitle.value.toString(),
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.purple,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Sisters",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                mProfile.sc_CountTitle.value.toString(),
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.purple,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Married Sisters",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                mProfile.msc_CountTitle.value.toString(),
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.purple,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Family Status",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                mProfile.FamilyStatusTitle_en.value.toString(),
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.purple,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Family Value",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                mProfile.FamilyValueTitle_ta.value.toString(),
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.purple,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Family Type",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                mProfile.FamilyTypeTitle_en.value.toString(),
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.purple,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Divider(
            height: 15,
            thickness: 2,
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
