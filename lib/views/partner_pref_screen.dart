import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kannada_devangar/components/appbar_title.dart';
import 'package:kannada_devangar/components/rounded_input.dart';
import 'package:kannada_devangar/controller/partner_pref_controller.dart';
import 'package:kannada_devangar/core/colors.dart';
import 'package:kannada_devangar/utility/app_drawer.dart';
import 'package:kannada_devangar/widget/kulam_dropdown.dart';
import 'package:kannada_devangar/widget/maritual_status_dropdown.dart';
import 'package:kannada_devangar/widget/raasi_dropdown.dart';
import 'package:kannada_devangar/widget/star_dropdown.dart';
import 'package:kannada_devangar/widget/thavir_kulam_dropdown.dart';

var formatter = new DateFormat('dd-MM-yyyy');

_formatDate(DateTime date) {
  if (date != null) {
    return formatter.format(date);
  } else {
    return 'NA';
  }
}

class PartnerPref_Screen extends StatefulWidget {
  @override
  _PartnerPref_ScreenState createState() => _PartnerPref_ScreenState();
}

/*class _PartnerPref_ScreenState extends State<PartnerPref_Screen> {
  final pController = Partner_Pref_Controller.to;
  var selectedValue;
  List<String> _months = <String>['1 month', '3 months', '6 months', '1 year'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new AppBarTitle("Partner Preference"),
        backgroundColor: TassistMenuBg,
      ),
      drawer: AppDrawer(),
      body: PageView(
        controller: Partner_Pref_Controller,
        children: <Widget>[
          Center(
            child: DropdownButton(
              items: _months
                  .map((value) => DropdownMenuItem(
                        child: Text(
                          value,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(color: TassistPrimaryBackground),
                        ),
                        value: value,
                      ))
                  .toList(),
              onChanged: (selectedMonth) {
                setState(() {
                  selectedValue = selectedMonth;
                });
              },
              // value: Text(selectedValue.toString(), style: Theme.of(context).textTheme.bodyText1.copyWith(
              //       color: TassistWhite,
              //       fontSize: 12.0,
              //     )),
              value: selectedValue,

              isExpanded: false,
              hint: Text('Period',
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                        color: TassistInfoBlue,
                        fontSize: 12.0,
                      )),
            ),
          )
        ],
      ),
    );
  }
}*/
class _PartnerPref_ScreenState extends State<PartnerPref_Screen> {
  //final pController = Partner_Pref_Controller.to;
  final Partner_Pref_Controller pController =
      Get.put(Partner_Pref_Controller());
  List<String> _months = <String>['1 month', '3 months', '6 months', '1 year'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new AppBarTitle("Partner Preference"),
        backgroundColor: TassistMenuBg,
      ),
      drawer: AppDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            padding: EdgeInsets.all(16),
            alignment: Alignment.topCenter,
            margin: EdgeInsets.symmetric(horizontal: 5),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Age From'),
                      SizedBox(
                        height: 10.0,
                      ),
                      Obx(
                        () => RoundedInput(
                          hintText: pController.AgeFrom.value,
                          onSubmit: (value) => pController.SetAgeFrom(value),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text('Age To'),
                      SizedBox(
                        height: 10.0,
                      ),
                      Obx(
                        () => RoundedInput(
                          hintText: pController.AgeTo.value,
                          onSubmit: (value) => pController.SetAgeTo(
                            (value),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text('Sevai Dhosam'),
                      SizedBox(
                        height: 10.0,
                      ),
                      Obx(
                        () => Switch(
                          onChanged: (value) =>
                              pController.SetIsSevaiDhosam(value),
                          activeColor: Colors.purple,
                          value: pController.IsSevaiDhosam.value,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text('Raagu Kedhu'),
                      SizedBox(
                        height: 10.0,
                      ),
                      Obx(
                        () => Switch(
                          onChanged: (value) =>
                              pController.SetIsRaaguKedhu(value),
                          activeColor: Colors.purple,
                          value: pController.IsRaaguKedhu.value,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text('Sutha Jadhagam'),
                      SizedBox(
                        height: 10.0,
                      ),
                      Obx(
                        () => Switch(
                          onChanged: (value) =>
                              pController.SetIsSuthaJadhagam(value),
                          activeColor: Colors.purple,
                          value: pController.IsSuthaJadhagam.value,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text('Maritual Status'),
                      SizedBox(
                        height: 10.0,
                      ),
                      MaritualStatus_DropDown(),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text('Kulam'),
                      SizedBox(
                        height: 10.0,
                      ),
                      Kulam_DropDown(),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text('Thavirkum Kulam'),
                      SizedBox(
                        height: 10.0,
                      ),
                      Thavirkum_Kulam_DropDown(),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text('Raasi'),
                      SizedBox(
                        height: 10.0,
                      ),
                      Raasi_DropDown(),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text('Natchathiram'),
                      SizedBox(
                        height: 10.0,
                      ),
                      Star_DropDown(),
                      SizedBox(
                        height: 10.0,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
