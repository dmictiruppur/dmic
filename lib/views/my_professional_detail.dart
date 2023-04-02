import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controller/member_detail_controller.dart';

class MyProfile_ProfessionalDetail extends StatefulWidget {
  final String RegistrationId;

  MyProfile_ProfessionalDetail({this.RegistrationId});

  @override
  _MyProfile_ProfessionalDetailState createState() =>
      _MyProfile_ProfessionalDetailState();
}

class _MyProfile_ProfessionalDetailState
    extends State<MyProfile_ProfessionalDetail> {
  final MemberDetailController mProfile = Get.put(MemberDetailController());
  SharedPreferences sharedPreferences;
  String RegistrationId = "";

  checkMemberDetail() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      RegistrationId = sharedPreferences.getString("RegistrationId").toString();
      //mProfile.fetchProfessionalDetail(this.RegistrationId.toString());
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
                    "Professional Detail",
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
                "Education",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                mProfile.EducationTitle_en.value,
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
                "Employeed In",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                mProfile.EmployeeInTitle_en.value,
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
                "Occupation",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                mProfile.ProfessionalTitle_en.value,
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
                "Organization Name",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                mProfile.OrganizationName.value,
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
                "Salary / Annum",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                mProfile.SalaryPerAnnumInRs.value,
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
            height: 15,
          ),
        ],
      ),
    );
  }
}
