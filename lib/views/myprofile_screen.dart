import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kannada_devangar/components/appbar_title.dart';
import 'package:kannada_devangar/core/colors.dart';
import 'package:kannada_devangar/utility/app_drawer.dart';
import 'package:kannada_devangar/views/my_aboutus_detail.dart';
import 'package:kannada_devangar/views/my_basic_detail.dart';
import 'package:kannada_devangar/views/my_family_detail.dart';
import 'package:kannada_devangar/views/my_kulam_detail.dart';
import 'package:kannada_devangar/views/my_professional_detail.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controller/member_detail_controller.dart';

var formatter = new DateFormat('dd-MM-yyyy');

_formatDate(DateTime date) {
  if (date != null) {
    return formatter.format(date);
  } else {
    return 'NA';
  }
}

class MyProfileScreen extends StatefulWidget {
  final String pageTitle;

  MyProfileScreen({this.pageTitle});

  @override
  _MyProfileScreenState createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  //final pageViewController = PageController();
  //final mProfile = MyProfileController().to;
  //final mProfile = MyProfileController.to;
  final MemberDetailController mProfile = Get.put(MemberDetailController());
  SharedPreferences sharedPreferences;
  String RegistrationId = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkMemberDetail();
  }

  checkMemberDetail() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      RegistrationId = sharedPreferences.getString("RegistrationId").toString();
      //mProfile.fetchBasicDetail(RegistrationId.toString());
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: new AppBarTitle("My Profile"),
        backgroundColor: TassistMenuBg,
      ),
      drawer: AppDrawer(),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: [
            Text(
              "PERSONAL INFORMATION",
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.green,
                  fontWeight: FontWeight.bold),
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(
              height: 40.0,
            ),
            //About us Widget
            MyProfile_AboutUsDetail(RegistrationId: RegistrationId),
            MyProfile_BasicDetail(RegistrationId: RegistrationId),
            MyProfile_ProfessionalDetail(RegistrationId: RegistrationId),
            MyProfile_FamilyDetail(RegistrationId: RegistrationId),
            MyProfile_KolamDetail(RegistrationId: RegistrationId),
            /*Center(
              child: Stack(
                children: [
                  Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                      border: Border.all(width: 4, color: Colors.purple),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 10,
                          color: Colors.black.withOpacity(0.1),
                          offset: Offset(0, 10),
                        ),
                      ],
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "http://192.168.1.6/yst/porutham/admin/assets/images/users/no-image.jpg"),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 4,
                          color: Colors.purple,
                        ),
                        color: Colors.green,
                      ),
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            )*/
          ],
        ),
      ),
    );
  }
}
