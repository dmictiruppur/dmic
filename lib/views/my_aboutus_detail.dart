import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/member_detail_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProfile_AboutUsDetail extends StatefulWidget {
  final String RegistrationId;

  MyProfile_AboutUsDetail({this.RegistrationId});

  @override
  _MyProfile_AboutUsDetailState createState() =>
      _MyProfile_AboutUsDetailState();
}

class _MyProfile_AboutUsDetailState extends State<MyProfile_AboutUsDetail> {
  final MemberDetailController mProfile = Get.put(MemberDetailController());
  SharedPreferences sharedPreferences;
  String RegistrationId = "";

  /*checkMemberDetail() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      RegistrationId = sharedPreferences.getString("RegistrationId").toString();
      mProfile.fetchBasicDetail(this.RegistrationId.toString());
    });
  }*/

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //checkMemberDetail();
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
                    "About My Self",
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
          SizedBox(
            height: 15,
          ),
          Obx(
            () => Text(
              mProfile.AboutMySelf.value,
              style: TextStyle(fontSize: 15.0, color: Colors.purple),
            ),
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
