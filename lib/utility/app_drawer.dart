import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kannada_devangar/controller/app_drawer_controller.dart';
import 'package:kannada_devangar/controller/home_controller.dart';
import 'package:kannada_devangar/core/colors.dart';
import 'app_routers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppDrawer extends GetView<AppDrawerController> {
  //final Map<String, dynamic> aruguments;
  //const AppDrawer({this.aruguments});

  final AppDrawerController _appDrawerController =
      Get.put(AppDrawerController());
  final HomeController hController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    //print('${aruguments['MemberName_en']}');
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(_appDrawerController.MemberName.toString()),
          ListTile(
            title: Text(
              'Home',
              style: TextStyle(color: TassistPrimaryBackground, fontSize: 12),
            ),
            trailing: Icon(Icons.dashboard, color: TassistPrimaryBackground),
            onTap: () {
              Get.offAllNamed(Routes.homeView);
            },
          ),
          ListTile(
            title: Text(
              'My Profile',
              style: TextStyle(color: TassistPrimaryBackground, fontSize: 12),
            ),
            trailing: Icon(Icons.person, color: TassistPrimaryBackground),
            onTap: () {
              Get.offAllNamed(Routes.myProfileView);
            },
          ),
          ListTile(
            title: Text(
              'Profile Image',
              style: TextStyle(color: TassistPrimaryBackground, fontSize: 12),
            ),
            trailing:
                Icon(Icons.upload_rounded, color: TassistPrimaryBackground),
            onTap: () {
              Get.offAllNamed(Routes.profileimage);
            },
          ),
          /*ListTile(
            title: Text(
              'Horoscope Upload',
              style: TextStyle(color: TassistPrimaryBackground, fontSize: 12),
            ),
            trailing: Icon(Icons.upload_file, color: TassistPrimaryBackground),
            onTap: () {
              Get.toNamed(Routes.horoscopeimage);
            },
          ),*/
          ListTile(
            title: Text(
              'Aadhar Upload',
              style: TextStyle(color: TassistPrimaryBackground, fontSize: 12),
            ),
            trailing: Icon(Icons.person, color: TassistPrimaryBackground),
            onTap: () {
              Get.offAllNamed(Routes.aadharimage);
            },
          ),
          /*ListTile(
            title: Text(
              'Partner Preference',
              style: TextStyle(color: TassistPrimaryBackground, fontSize: 12),
            ),
            trailing: Icon(Icons.person, color: TassistPrimaryBackground),
            onTap: () {
              Get.toNamed(Routes.partnerprefView);
            },
          ),*/
          /*ListTile(
            title: Text(
              'Your Match',
              style: TextStyle(color: TassistPrimaryBackground, fontSize: 12),
            ),
            trailing: Icon(Icons.search, color: TassistPrimaryBackground),
            onTap: () {
              Get.toNamed(Routes.yourmatchView);
            },
          ),*/
          ListTile(
            title: Text(
              'Search',
              style: TextStyle(color: TassistPrimaryBackground, fontSize: 12),
            ),
            trailing: Icon(Icons.search, color: TassistPrimaryBackground),
            onTap: () {
              Get.offAllNamed(Routes.searchView);
            },
          ),
          ListTile(
            title: Text(
              'Payment',
              style: TextStyle(color: TassistPrimaryBackground, fontSize: 12),
            ),
            trailing:
                Icon(Icons.credit_card_sharp, color: TassistPrimaryBackground),
            onTap: () {
              Get.offAllNamed(Routes.paymentView);
            },
          ),
          /*ListTile(
            title: Text(
              'Orders',
              style: TextStyle(color: TassistPrimaryBackground, fontSize: 12),
            ),
            trailing: Icon(Icons.list, color: TassistPrimaryBackground),
            onTap: () {
              Get.toNamed(Routes.ordersView);
            },
          ),*/
          /*ListTile(
            title: Text(
              'Unlocked Profiles',
              style: TextStyle(color: TassistPrimaryBackground, fontSize: 12),
            ),
            trailing: Icon(Icons.lock_open, color: TassistPrimaryBackground),
            onTap: () {
              Get.toNamed(Routes.unlockedprofileView);
            },
          ),*/
          ListTile(
            title: Text(
              'Help',
              style: TextStyle(color: TassistPrimaryBackground, fontSize: 12),
            ),
            trailing: Icon(Icons.help, color: TassistPrimaryBackground),
            onTap: () {
              Get.offAllNamed(Routes.help_page);
            },
          ),
          ListTile(
            title: Text(
              'Feedback & Share',
              style: TextStyle(color: TassistPrimaryBackground, fontSize: 12),
            ),
            trailing: Icon(Icons.feedback, color: TassistPrimaryBackground),
            onTap: () {
              Get.offAllNamed(Routes.feedback_share);
            },
          ),
          ListTile(
            title: Text(
              'Logout',
              style: TextStyle(color: TassistPrimaryBackground, fontSize: 12),
            ),
            trailing: Icon(Icons.lock_open, color: TassistPrimaryBackground),
            onTap: () {
              //controller.logout();
              LogoutFunction();
            },
          ),
        ],
      ),
    );
  }
}

Widget _createHeader(String MemberName) {
  final HomeController hController = Get.put(HomeController());
  return DrawerHeader(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          child: Icon(
            Icons.person_outline,
            color: TassistInfoGrey,
            size: 40.0,
          ),
          radius: 25.0,
          backgroundColor: TassistWhite,
        ),
        SizedBox(
          width: 70,
        ),

        FittedBox(
          child: Text(
            MemberName.toString(),
            style: TextStyle(color: TassistWhite, fontSize: 14.0),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Text("Curr Version | ${hController.CurVer}"),

        //  RaisedButton(
        //    color: TassistWhite,
        //    child:
        //    Row(children: <Widget>[
        //   Icon(FontAwesomeIcons.laptop),
        //   SizedBox(width: 20),
        //   Text('Get Tally Connector')

        //    ]),
        // onPressed: () => _launchURL(),)
      ],
    ),
    decoration: BoxDecoration(
      color: TassistMenuBg,
      shape: BoxShape.rectangle,
    ),
  );
}

LogoutFunction() async {
  SharedPreferences sharedPreferences;
  sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.clear();
  Get.offAllNamed(Routes.welcomeView);
}
