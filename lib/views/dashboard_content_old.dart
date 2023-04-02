import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:kannada_devangar/components/top_unlockprofile.dart';
import 'package:kannada_devangar/controller/member_detail_controller.dart';
import 'package:kannada_devangar/controller/orderdetail_controller.dart';
import 'package:kannada_devangar/core/urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardContent extends StatefulWidget {
  @override
  _DashboardContentState createState() => _DashboardContentState();
}

class _DashboardContentState extends State<DashboardContent> {
  final OrderDetailController odController = Get.put(OrderDetailController());
  SharedPreferences sharedPreferences;
  String MemberName = "";
  String RegistrationId = "";
  String ProfilePhoto1 = "";
  String ProfilePhoto2 = "";
  String RegCode = "";
  int ProfileCount = 5;

  List users = [];
  bool isLoading = false;

  static Dio dio = new Dio();

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      RegistrationId = sharedPreferences.getString("RegistrationId").toString();
      MemberName = sharedPreferences.getString("MemberName").toString();
      ProfilePhoto1 = sharedPreferences.getString("ProfilePhoto1").toString();
      ProfilePhoto2 = sharedPreferences.getString("ProfilePhoto2").toString();
      RegCode = sharedPreferences.getString("RegCode").toString();

      odController.fetchBasicDetail(RegistrationId);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLoginStatus();
  }

  @override
  Widget build(BuildContext context) {
    //odController.fetchUnlockedProfileList(RegistrationId, 5);
    return Column(
      children: [
        Expanded(
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.all(1.0),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 150.0,
                  decoration: new BoxDecoration(
                    color: Color(0xFF9A10FF),
                    boxShadow: <BoxShadow>[
                      new BoxShadow(
                          spreadRadius: 2.0,
                          blurRadius: 4.0,
                          offset: new Offset(0.0, 1.0),
                          color: Colors.black38),
                    ],
                  ),
                  child: new Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      new Container(
                        height: 150.0,
                        decoration: new BoxDecoration(
                          gradient: new LinearGradient(colors: <Color>[
                            //7928D1
                            const Color(0xFF7928D1), const Color(0xFF9A4DFF)
                          ], stops: <double>[
                            0.3,
                            0.5
                          ], begin: Alignment.topRight, end: Alignment.bottomLeft),
                        ),
                      ),
                      /*new Padding(
                        padding: new EdgeInsets.only(
                            top: MediaQuery.of(context).padding.top,
                            left: 15.0,
                            right: 15.0,
                            bottom: 10.0),
                      ),*/
                      Container(
                        height: 150,
                        child: Column(
                          children: [
                            new Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          width: 100,
                                          child: Column(
                                            children: [
                                              /*Obx(
                                                      () => Container(
                                                    width: 70.0,
                                                    height: 60.0,
                                                    decoration: new BoxDecoration(
                                                      image: new DecorationImage(
                                                          image: new NetworkImage(URLs.ImgUrl+"/"+ RegistrationId+"/"+mController.ProfilePhotoImage.value),
                                                          fit: BoxFit.cover),
                                                      borderRadius:
                                                      new BorderRadius.all(new Radius.circular(20.0)),
                                                      boxShadow: <BoxShadow>[
                                                        new BoxShadow(
                                                            color: Colors.black26,
                                                            blurRadius: 5.0,
                                                            spreadRadius: 1.0),
                                                      ],
                                                    ),
                                                  )
                                              ),*/
                                              SizedBox(
                                                height: 20,
                                              ),
                                              /*Obx( () =>Container(
                                                width: 70.0,
                                                height: 60.0,
                                                decoration: new BoxDecoration(
                                                  image: new DecorationImage(
                                                      image: new NetworkImage(URLs.ImgUrl+"/"+ RegistrationId+"/"+mController.FullSizePhoto.value),
                                                      fit: BoxFit.cover),
                                                  borderRadius:
                                                  new BorderRadius.all(new Radius.circular(20.0)),
                                                  boxShadow: <BoxShadow>[
                                                    new BoxShadow(
                                                        color: Colors.black26,
                                                        blurRadius: 5.0,
                                                        spreadRadius: 1.0),
                                                  ],
                                                ),
                                              ),
                                              ),*/
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 200,
                                          child: new Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              new Text(
                                                MemberName.toString(),
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 20.0),
                                              ),
                                              new Padding(padding: const EdgeInsets.only(right: 15.0)),
                                              new Padding(padding: const EdgeInsets.only(top: 10.0)),
                                              new Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  Obx(() =>
                                                      Column(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children: <Widget>[
                                                          new Text(odController.OrderDate.value,
                                                            style: TextStyle(
                                                                fontSize: 16.0, color: Colors.white),
                                                          ),
                                                          new Text(
                                                            odController.RemDays.value.toString(),
                                                            style: TextStyle(
                                                                fontSize: 20.0,
                                                                fontWeight: FontWeight.w800,
                                                                color: Colors.white),
                                                          ),
                                                          SizedBox(
                                                            height: 15.0,
                                                          ),
                                                          new Text(odController.PackageName.value,
                                                            style: TextStyle(
                                                                fontSize: 16.0, color: Colors.white),
                                                          ),
                                                          new Text(odController.ProfileCount.value,
                                                            style: TextStyle(
                                                                fontSize: 20.0,
                                                                fontWeight: FontWeight.w800,
                                                                color: Colors.white),
                                                          ),
                                                        ],
                                                      ),
                                                  ),
                                                  _buildVerticalDivider(),
                                                  Obx(() => Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: <Widget>[
                                                      new Text("Used",
                                                        style: TextStyle(
                                                            fontSize: 16.0, color: Colors.white),
                                                      ),
                                                      new Text(
                                                        odController.ViewedProfileCount.value,
                                                        style: TextStyle(
                                                            fontSize: 20.0,
                                                            fontWeight: FontWeight.w800,
                                                            color: Colors.white),
                                                      ),
                                                      new Text("Balance",
                                                        style: TextStyle(
                                                            fontSize: 16.0, color: Colors.white),
                                                      ),
                                                      new Text(odController.BalViewCount.value,
                                                        style: TextStyle(
                                                            fontSize: 20.0,
                                                            fontWeight: FontWeight.w800,
                                                            color: Colors.white),
                                                      ),
                                                    ],
                                                  )),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                //new Padding(padding: const EdgeInsets.fromLTRB(10.0, 15, 15, 5)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              //TopUnlockWidget(),
              //LoadUnlockProfile(RegistrationId),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFollowerStat(String title, String value) {
    final titleStyle = new TextStyle(fontSize: 16.0, color: Colors.white);
    final valueStyle = new TextStyle(
        fontSize: 20.0, fontWeight: FontWeight.w800, color: Colors.white);
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new Text(title, style: titleStyle),
        new Text(value, style: valueStyle),
      ],
    );
  }

  Widget _buildVerticalDivider() {
    return new Container(
      height: 80.0,
      width: 2.0,
      color: Colors.white30,
      margin: const EdgeInsets.only(left: 25.0, right: 25.0),
    );
  }
}
