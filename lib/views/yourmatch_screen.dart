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

class Yourmatch_Screen extends StatefulWidget {
  final String pageTitle;

  Yourmatch_Screen({this.pageTitle});

  @override
  _Yourmatch_ScreenState createState() => _Yourmatch_ScreenState();
}

class _Yourmatch_ScreenState extends State<Yourmatch_Screen> {
  final pageViewController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new AppBarTitle("Your Match"),
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
