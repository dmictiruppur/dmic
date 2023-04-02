import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/member_detail_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProfile_KolamDetail extends StatefulWidget {
  final String RegistrationId;

  MyProfile_KolamDetail({this.RegistrationId});

  @override
  _MyProfile_KolamDetailState createState() => _MyProfile_KolamDetailState();
}

class _MyProfile_KolamDetailState extends State<MyProfile_KolamDetail> {
  final MemberDetailController mProfile = Get.put(MemberDetailController());
  SharedPreferences sharedPreferences;
  String RegistrationId = "";

  checkMemberDetail() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      RegistrationId = sharedPreferences.getString("RegistrationId").toString();
      //mProfile.fetchKolamDetail(this.RegistrationId.toString());
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
                    "Kolam / Kothiram Detail",
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
                "Kulam",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                mProfile.KolamTitle_en.value,
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
                "Gothram",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                mProfile.GothramTitle_en.value,
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
                "Raasi",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                mProfile.RasiMoonTitle_en.value,
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
                "Natchathiram",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                mProfile.StarProTitle_en.value,
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
                "Place Of Birth",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                mProfile.BirthPlace.value,
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
          /*Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Date Of Birth",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                mProfile.mDob.value.toString(),
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
                "Time Of Birth",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                mProfile.TimeOfBirth.value,
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.purple,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),*/
          /*Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Sevvai Dosham",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                mProfile.IsSevaiDhosam.value.toString(),
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
                "Ragu Kedhu",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                mProfile.IsRaguKedhu.value.toString(),
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
                "Sutha Jadhagam",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                mProfile.IsSuthaJadhagam.value.toString(),
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.purple,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),*/
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
