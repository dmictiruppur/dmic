import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:kannada_devangar/controller/search_controller.dart';
import 'package:kannada_devangar/controller/search_member_controller.dart';
import 'package:kannada_devangar/core/urls.dart';

class MaritualStatus_DropDown extends StatefulWidget {
  String selectedMsItem;
  @override
  _MaritualStatus_DropDownState createState() =>
      _MaritualStatus_DropDownState();
}

class _MaritualStatus_DropDownState extends State<MaritualStatus_DropDown> {
  //final pController = Search_Controller.to;
  //final SearchDetailController pController = Get.put(SearchDetailController());
  final Search_Controller pController = Get.put(Search_Controller());
  //final Search_Member_Controller pController = Get.put(Search_Member_Controller());
  bool IsLoading = true;
  List data = [];

  Future<String> getMatirualStatus() async {
    var response =
        await http.get(Uri.parse(URLs.get_maritualstatuslist), headers: {"Accept": "application/json"});
    var resBody = json.decode(response.body);
    setState(() {
      data = resBody;
      IsLoading = false;
    });
    return "Success";
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getMatirualStatus();
    /*setState(() {
      widget.selectedMsItem = pController.sMaritalStatusId.value;
    });*/
  }

  @override
  Widget build(BuildContext context) {
    //print(pController.sMaritalStatusId.value);
    return Container(
      child: IsLoading
          ? CircularProgressIndicator()
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*DropdownMenuItem(
            child: Text("NA"),
            value: "0",
          ),*/
                DropdownButton(
                  items: data.map((item) {
                    /*DropdownMenuItem(
                child: Text("First Item"),
                value: "0",
              );*/
                    return DropdownMenuItem(
                      child: Text(
                        item['MaritalStatusTitle'],
                        style: TextStyle(color: Colors.purple),
                      ),
                      value: item['MaritalStatusId'].toString(),
                    );
                  }).toList(),
                  onChanged: (newVal) {
                    setState(() {
                      widget.selectedMsItem = newVal.toString();
                      pController.SetsMaritalStatusId(newVal.toString());
                    });
                  },
                  isExpanded: false,
                  value: widget.selectedMsItem,
                  hint: Text('Select a Maritual Status'),
                )
              ],
            ),
    );
  }
}
