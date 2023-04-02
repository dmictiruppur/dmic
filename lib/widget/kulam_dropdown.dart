import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:kannada_devangar/controller/search_controller.dart';
import 'package:kannada_devangar/controller/search_member_controller.dart';
import 'package:kannada_devangar/core/urls.dart';

class Kulam_DropDown extends StatefulWidget {
  String selectedKulamItem;
  @override
  _Kulam_DropDownState createState() => _Kulam_DropDownState();

  /*Kulam_DropDown({Key key, @required this.selectedItem}) : super(key: key);*/
}

class _Kulam_DropDownState extends State<Kulam_DropDown> {
  final Search_Controller pController = Get.put(Search_Controller());
  //final Search_Member_Controller pController = Get.put(Search_Member_Controller());
  //final SearchDetailController pController = Get.put(SearchDetailController());
  bool IsLoading = true;
  List data = [];

  Future<String> getKolamList() async {
    var response =
        await http.get(Uri.parse(URLs.get_kolamlist), headers: {"Accept": "application/json"});
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
    this.getKolamList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: IsLoading
          ? CircularProgressIndicator()
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropdownButton(
                  items: data.map((item) {
                    /*DropdownMenuItem(
                child: Text("First Item"),
                value: "0",
              );*/
                    return DropdownMenuItem(
                      child: Text(
                        item['KolamTitle'],
                        style: TextStyle(color: Colors.purple),
                      ),
                      value: item['KolamId'].toString(),
                    );
                  }).toList(),
                  onChanged: (newVal) {
                    setState(() {
                      widget.selectedKulamItem = newVal.toString();
                      pController.SetsKolamId(newVal.toString());
                    });
                  },
                  value: widget.selectedKulamItem,
                  hint: Text('Select a Kolam'),
                ),
              ],
            ),
    );
  }
}
