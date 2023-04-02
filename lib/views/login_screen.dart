import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kannada_devangar/components/custom_flat_button.dart';
import 'package:kannada_devangar/components/custom_text_form_field.dart';
import 'package:kannada_devangar/controller/member_login_controller.dart';
import 'package:kannada_devangar/core/colors.dart';
import 'package:kannada_devangar/core/styles.dart';
import 'package:kannada_devangar/services/auth_service.dart';
import 'package:kannada_devangar/utility/app_routers.dart';

/*class LoginScreen extends StatefulWidget {
  final Function toggleView;
  LoginScreen({this.toggleView});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthServices _auth = AuthServices();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 32),
          alignment: Alignment.topCenter,
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
                  style: logoStyle,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  style: Theme.of(context).textTheme.bodyText2,
                  decoration: InputDecoration(
                      icon: Icon(Icons.email, color: TassistPrimaryBackground),
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
                      icon: Icon(Icons.lock, color: TassistPrimaryBackground),
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
                  height: 10,
                ),
                RaisedButton(
                  color: TassistPrimaryBackground,
                  elevation: 20.0,
                  child: Text(
                    'Sign In',
                    style: TextStyle(color: Colors.white),
                  ),
                  *//*onPressed: LoginController.to.formLoginIsValid
                      ? () => LoginController.to.authLocal()
                      : null,*//*
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
                      }
                    }
                  },
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
}*/

class MemberLoginScreen extends GetView<MemberLoginController> {
  final MemberLoginController _memberLoginController = Get.put(MemberLoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 15),
          alignment: Alignment.topCenter,
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
          child: Form(
            child: Obx(() => ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    //Image.asset('images/welcome.png', width: 190, height: 100),
                    Text(
                      'Kannada Devangar Marriage Information Center',
                      style: logoStyle,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          icon: Icon(Icons.email, color: Colors.white),
                          hintText: 'Enter Aadhar no please',
                          hintStyle: TextStyle(color: Colors.white),
                          labelText: 'Aadhar No',
                          labelStyle: TextStyle(color: Colors.white),
                          errorText: controller.to.usernameIsValid ? null : 'Aadhar No Missing',
                        errorStyle: TextStyle(color: Colors.red, fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      validator: (val) => val.isEmpty ? 'Enter an email' : null,
                      onChanged: (val) {
                        controller.to.changeUsername(val);
                      },
                    ),
                    /*CustomTextFormField(
                      labelText: 'User Name',
                      autocorrect: false,
                      onChanged: controller.to.changeUsername,
                      errorText: controller.to.usernameIsValid
                          ? null
                          : 'Username Missing',
                    ),*/
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      autocorrect: false,
                      obscureText: true,
                      decoration: InputDecoration(
                        icon: Icon(Icons.email, color: Colors.white),
                        hintText: 'Enter Password no please',
                        hintStyle: TextStyle(color: Colors.white),
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.white),
                        errorText: controller.to.passwordIsValid ? null : 'Password Missing',
                        errorStyle: TextStyle(color: Colors.red, fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      validator: (val) => val.isEmpty ? 'Enter Password' : null,
                      onChanged: (val) {
                        controller.to.changePassword(val);
                      },
                    ),
                    /*CustomTextFormField(
                      labelText: 'Password',
                      autocorrect: false,
                      obscureText: true,
                      onChanged: controller.to.changePassword,
                      errorText: controller.to.passwordIsValid
                          ? null
                          : 'Password Missing',
                    ),*/
                    SizedBox(
                      height: 10,
                    ),
                    CustomFlatButton(
                      child: Obx(
                        () {
                          if (controller.to.isLoading == true) {
                            return CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                            );
                          }
                          return Text('LOGIN');
                        },
                      ),
                      onPressed: controller.to.formLoginIsValid
                          ? () => controller.MemberLoginFunction(controller.to.username.value, controller.to.password.value)
                          : null,
                    ),
                    SizedBox(height: 20,),
                    CustomFlatButton(
                      child: Text('REGISTER'),
                      onPressed: () {
                        Get.offAllNamed(Routes.registerView);
                      },
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}