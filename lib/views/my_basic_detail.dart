import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/member_detail_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProfile_BasicDetail extends StatefulWidget {
  final String RegistrationId;

  MyProfile_BasicDetail({this.RegistrationId});

  @override
  _MyProfile_BasicDetailState createState() => _MyProfile_BasicDetailState();
}

class _MyProfile_BasicDetailState extends State<MyProfile_BasicDetail> {
  final MemberDetailController mProfile = Get.put(MemberDetailController());
  SharedPreferences sharedPreferences;
  String RegistrationId = "";

  checkMemberDetail() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      RegistrationId = sharedPreferences.getString("RegistrationId").toString();
      //mProfile.fetchBasicDetail(this.RegistrationId.toString());
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
                    "Basic Detail",
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
          Divider(
            height: 15,
            thickness: 2,
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Profile Created By",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                mProfile.ProfileCreatedFor_en.value,
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
                "Age",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                mProfile.age.value,
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
                "Marital Status",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                mProfile.MaritalStatusTitle_en.value,
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
                "Body Type",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                mProfile.BodyTypeTitle_en.value,
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
                "City",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                mProfile.CityName_en.value,
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
                "Mobile No",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                mProfile.RegMobileNo.value,
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
                "Alternate No",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                mProfile.AlternateMobileNo.value,
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
                "E-Mail Id",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                mProfile.EmailId.value,
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.purple,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Divider(
            height: 15,
            thickness: 2,
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
