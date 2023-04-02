import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kannada_devangar/components/custom_flat_button.dart';
import 'package:kannada_devangar/controller/member_register_controller.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:kannada_devangar/core/styles.dart';
import 'package:kannada_devangar/utility/app_routers.dart';

class RegisterScreen extends GetView<MemberRegisterController> {
  final MemberRegisterController _controller = Get.put(MemberRegisterController());

  var AadharController = new MaskedTextController(mask: '0000-0000-0000');

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
            child: Obx(() => ListView(
              shrinkWrap: true,
              children: <Widget>[
                Text(
                  'Kannada Devangar Marriage Information Center',
                  style: logoStyle,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
                /*TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    icon: Icon(Icons.person, color: Colors.white),
                    hintText: 'Enter Aadhar no please',
                    hintStyle: TextStyle(color: Colors.white),
                    labelText: 'Aadhar No',
                    labelStyle: TextStyle(color: Colors.white),
                    errorText: controller.to.usernameIsValid ? null : 'Aadhar No Missing',
                    errorStyle: TextStyle(color: Colors.red, fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  validator: (val) => val.isEmpty ? 'Enter an Aadhar' : null,
                  onChanged: (val) {
                    controller.to.changeUsername(val);
                  },
                ),*/
                TextField(
                  controller: AadharController,
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    icon: Icon(Icons.person, color: Colors.white),
                    hintText: 'Enter Aadhar no please',
                    hintStyle: TextStyle(color: Colors.white),
                    labelText: 'Aadhar No',
                    labelStyle: TextStyle(color: Colors.white),
                    errorText: _controller.to.usernameIsValid ? null : 'Aadhar No Missing',
                    errorStyle: TextStyle(color: Colors.red, fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  onChanged: (val) {
                    _controller.to.changeUsername(val);
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  autocorrect: false,
                  obscureText: true,
                  decoration: InputDecoration(
                    icon: Icon(Icons.password, color: Colors.white),
                    hintText: 'Enter Password no please',
                    hintStyle: TextStyle(color: Colors.white),
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.white),
                    errorText: _controller.to.passwordIsValid ? null : 'Password Missing',
                    errorStyle: TextStyle(color: Colors.red, fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  validator: (val) => val.isEmpty ? 'Enter Password' : null,
                  onChanged: (val) {
                    _controller.to.changePassword(val);
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    icon: Icon(Icons.email, color: Colors.white),
                    hintText: 'Enter Valid E-Mail',
                    hintStyle: TextStyle(color: Colors.white),
                    labelText: 'E-Mail Id',
                    labelStyle: TextStyle(color: Colors.white),
                    errorText: _controller.to.EmailIdIsValid ? null : 'E-Mail Missing',
                    errorStyle: TextStyle(color: Colors.red, fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  validator: (val) => val.isEmpty ? 'Enter an email' : null,
                  onChanged: (val) {
                    _controller.to.changeEmailId(val);
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    icon: Icon(Icons.email, color: Colors.white),
                    hintText: 'Enter Valid Mobile No',
                    hintStyle: TextStyle(color: Colors.white),
                    labelText: 'Mobile No',
                    labelStyle: TextStyle(color: Colors.white),
                    errorText: _controller.to.mobilenoIsValid ? null : 'Mobile NoMissing',
                    errorStyle: TextStyle(color: Colors.red, fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  validator: (val) => val.isEmpty ? 'Enter Mobile No' : null,
                  onChanged: (val) {
                    _controller.to.changeMobileNo(val);
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                CustomFlatButton(
                  child: Obx(
                        () {
                      if (_controller.to.isLoading == true) {
                        return CircularProgressIndicator(
                          valueColor:
                          AlwaysStoppedAnimation<Color>(Colors.white),
                        );
                      }
                      return Text('REGISTER');
                    },
                  ),
                  onPressed: _controller.to.formLoginIsValid
                      ? () => _controller.MemberSignupFunction(_controller.to.username.value, _controller.to.password.value, _controller.to.emailid.value, _controller.to.mobileno.value)
                      : null,
                ),
                SizedBox(height: 20,),
                CustomFlatButton(
                  child: Text('LOGIN'),
                  onPressed: () {
                    Get.offAllNamed(Routes.loginview);
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
