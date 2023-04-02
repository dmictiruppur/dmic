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

class Order_Screen extends StatefulWidget {
  final String pageTitle;

  Order_Screen({this.pageTitle});

  @override
  _Order_ScreenState createState() => _Order_ScreenState();
}

class _Order_ScreenState extends State<Order_Screen> {
  final pageViewController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new AppBarTitle("Orders List"),
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
