import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kannada_devangar/core/colors.dart';
import 'package:kannada_devangar/models/user_model.dart';
import 'package:kannada_devangar/services/auth_service.dart';
import 'package:kannada_devangar/utility/app_routers.dart';

class LoginScreen extends StatefulWidget {
  final Function toggleView;
  LoginScreen({this.toggleView});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final AuthServices _auth = AuthServices();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;
  User user = new User();

  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 32),
          alignment: Alignment.topCenter,
          /*decoration: BoxDecoration(
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
          ),*/
          child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                //Image.asset('images/welcome.png', width: 190, height: 100),
                Text(
                  'Kannada Devangar Marriage Information Center',
                  style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 26,
                    color: Colors.purple,
                    letterSpacing: 2,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  style: Theme.of(context).textTheme.bodyText2,
                  decoration: InputDecoration(
                      icon: Icon(Icons.email, color: TassistInfoBlue),
                      hintText: 'Enter Aadhar no please',
                      hintStyle: Theme.of(context).textTheme.bodyText2,
                      labelText: 'Aadhar No'),
                  validator: (val) => val.isEmpty ? 'Enter an email' : null,
                  onChanged: (val) {
                    setState(() => email = val);
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  style: Theme.of(context).textTheme.bodyText2,
                  obscureText: true,
                  decoration: InputDecoration(
                      icon: Icon(Icons.email, color: TassistInfoBlue),
                      hintText: 'Enter Password please',
                      hintStyle: Theme.of(context).textTheme.bodyText2,
                      labelText: 'Password'),
                  validator: (val) =>
                      val.length < 3 ? 'Enter a password 3+ chars long' : null,
                  onChanged: (val) {
                    setState(() => password = val);
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    // Foreground color
                    onPrimary: Colors.white,
                    // Background color
                    primary: TassistPrimaryBackground,
                  ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      setState(() => loading = true);
                      var result = await _auth.login(email, password);
                      //print(result.RegistrationId.toString());
                      if (result == null) {
                        setState(() {
                          loading = false;
                          error = 'Could not sign in with those Details';
                        });
                      } else {
                        loading = false;
                        Get.toNamed(Routes.homeView);
                        /*Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                        );*/
                      }
                    }
                  },
                  child: const Text('Filled Tonal'),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14.0),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
