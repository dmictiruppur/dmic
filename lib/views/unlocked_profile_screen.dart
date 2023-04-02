import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kannada_devangar/components/appbar_title.dart';
import 'package:kannada_devangar/core/colors.dart';
import 'package:kannada_devangar/utility/app_drawer.dart';

var formatter = new DateFormat('dd-MM-yyyy');

_formatDate(DateTime date) {
  if (date != null) {
    return formatter.format(date);
  } else {
    return 'NA';
  }
}

class Unlocked_Profile_Screen extends StatefulWidget {
  final String pageTitle;

  Unlocked_Profile_Screen({this.pageTitle});

  @override
  _Unlocked_Profile_ScreenState createState() =>
      _Unlocked_Profile_ScreenState();
}

class _Unlocked_Profile_ScreenState extends State<Unlocked_Profile_Screen> {
  final pageViewController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new AppBarTitle("Unlocked Profile List"),
        backgroundColor: TassistMenuBg,
      ),
      drawer: AppDrawer(),
      body: PageView(
        controller: pageViewController,
        children: <Widget>[],
      ),
    );
  }
}
