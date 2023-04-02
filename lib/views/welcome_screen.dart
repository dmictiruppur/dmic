import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kannada_devangar/controller/welcome_controller.dart';
import 'package:kannada_devangar/core/open_url.dart';
import 'package:kannada_devangar/core/urls.dart';
import 'package:kannada_devangar/utility/app_routers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final Welcome_Controller _welcome_controller = Get.put(Welcome_Controller());
  SharedPreferences sharedPreferences;
  String MemberName = "";
  String RegistrationId = "";
  bool _isLogin = false;
  static Dio dio = new Dio();

  /*void onInit() async {
    //_welcome_controller.GetCurrentVersionNumber();
    print("No Output");
    var res1 = await http.get(Uri.parse(URLs.get_version));
    print("No Output = " + res1.body);
  }*/

  @override
  Widget build(BuildContext context) {
    _welcome_controller.GetCurrentVersionNumber();
    Size size = MediaQuery.of(context).size;
    checkLoginStatus();
    return Scaffold(
      backgroundColor: Colors.white,
      /*appBar: AppBar(
        title: Text('Welcome to DMIC'),
      ),*/
      body: Container(
        height: size.height,
        width: double.infinity,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            /*gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.1, 0.4, 0.7, 0.9],
            colors: [
              Color(0xFF3594DD),
              Color(0xFF4563DB),
              Color(0xFF5036D5),
              Color(0xFF5B16D0),
            ],
          ),*/
            ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 30, 10, 20),
              child: Column(
                children: [
                  Text(
                    'Welcome to DMIC',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                        fontSize: 50),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new Image.asset('assets/images/unnamed.png', height: 300),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          /*FlatButton.icon(
                            icon: Icon(
                              Icons.person,
                              color: Colors.black,
                            ),
                            label: Text(
                              'Login',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(color: Color(0xffffffff)),
                            ),
                            color: Color(0xff62e1fc),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4)),
                            onPressed: () {
                              Get.toNamed(Routes.loginview);
                            },
                          ),*/
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              // Foreground color
                              onPrimary: Colors.white,
                              // Background color
                              primary: Colors.purple,
                            ).copyWith(
                                elevation: ButtonStyleButton.allOrNull(0.0)),
                            onPressed: () {
                              Get.toNamed(Routes.loginview);
                            },
                            icon: Icon(
                              Icons.person,
                              color: Colors.black,
                              size: 24.0,
                            ),
                            label: Text(
                              'Login',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(color: Color(0xffffffff)),
                            ),
                          ),
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              // Foreground color
                              onPrimary: Colors.white,
                              // Background color
                              primary: Colors.purple,
                            ).copyWith(
                                elevation: ButtonStyleButton.allOrNull(0.0)),
                            onPressed: () {
                              Get.offAllNamed(Routes.registerView);
                            },
                            icon: Icon(
                              Icons.person,
                              color: Colors.black,
                              size: 24.0,
                            ),
                            label: Text(
                              'Register',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(color: Color(0xffffffff)),
                            ),
                          ),
                          /*FlatButton.icon(
                            icon: Icon(
                              Icons.person,
                              color: Colors.black,
                            ),
                            label: Text(
                              'Register',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(color: Color(0xffffffff)),
                            ),
                            color: Color(0xff62e1fc),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4)),
                            onPressed: () {
                              Get.offAllNamed(Routes.registerView);
                            },
                          ),*/
                          /*FlatButton(
                      onPressed: () {
                        Get.toNamed(Routes.loginview);
                      },
                      child: Text('Login'),
                      textColor: Colors.purpleAccent,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                    ),
                    FlatButton(
                      onPressed: () {
                        //Get.toNamed(Routes.registerView);
                        Get.toNamed(Routes.loginview);
                      },
                      child: Text('Register'),
                      textColor: Colors.white,
                      color: Colors.deepPurpleAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                    ),*/
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'ver : ',
                                style: TextStyle(color: Colors.deepPurple),
                              ),
                              Obx(
                                () => Text(
                                    _welcome_controller.version.toString(),
                                    style: TextStyle(color: Colors.deepPurple)),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    RegistrationId = sharedPreferences.getString("RegistrationId");
    if (sharedPreferences.getString("RegistrationId") != null) {
      _isLogin = true;
      Get.toNamed(Routes.homeView);
    }
  }
}

/*
class WelcomeScreen extends StatelessWidget {
  final Welcome_Controller _welcome_controller = Get.put(Welcome_Controller());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: size.height,
        width: double.infinity,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.1, 0.4, 0.7, 0.9],
            colors: [
              Color(0xFF3594DD),
              Color(0xFF4563DB),
              Color(0xFF5036D5),
              Color(0xFF5B16D0),
            ],
          ),
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Text('Welcome to DMIC',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                    fontSize: 50)),
            Positioned(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Image.asset('assets/images/unnamed.png', height: 400),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    FlatButton.icon(
                      icon: Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      label: Text(
                        'Login',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .copyWith(color: Color(0xffffffff)),
                      ),
                      color: Color(0xff62e1fc),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      onPressed: () {
                        Get.toNamed(Routes.loginview);
                      },
                    ),
                    FlatButton.icon(
                      icon: Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      label: Text(
                        'Register',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .copyWith(color: Color(0xffffffff)),
                      ),
                      color: Color(0xff62e1fc),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      onPressed: () {
                        Get.toNamed(Routes.loginview);
                      },
                    ),
                  ],
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
*/
