import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kannada_devangar/components/appbar_title.dart';
import 'package:kannada_devangar/core/colors.dart';
import 'package:kannada_devangar/utility/app_drawer.dart';
import 'package:kannada_devangar/views/dashboard_content.dart';

var formatter = new DateFormat('dd-MM-yyyy');

_formatDate(DateTime date) {
  if (date != null) {
    return formatter.format(date);
  } else {
    return 'NA';
  }
}

class HomeScreen extends StatefulWidget {
  final String pageTitle;

  HomeScreen({this.pageTitle});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final pageViewController = PageController();

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new AppBarTitle("Dashboard"),
        backgroundColor: TassistMenuBg,
      ),
      drawer: AppDrawer(),
      body: SafeArea(
        child: DashboardContent(),
      ),
    );
  }
}

class DropDownMonths extends StatefulWidget {
  @override
  _DropDownMonthsState createState() => _DropDownMonthsState();
}

class _DropDownMonthsState extends State<DropDownMonths> {
  var selectedValue;

  List<String> _months = <String>['1 month', '3 months', '6 months', '1 year'];

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                  color: TassistWhite,
                  fontSize: 12.0,
                )),
      ),
    );
  }
}
