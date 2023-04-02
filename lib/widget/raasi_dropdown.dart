import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:kannada_devangar/controller/search_controller.dart';
import 'package:kannada_devangar/controller/search_member_controller.dart';
import 'package:kannada_devangar/core/urls.dart';

class Raasi_DropDown extends StatefulWidget {
  String selectedRasiItem;
  @override
  _Raasi_DropDownState createState() => _Raasi_DropDownState();

  /*Raasi_DropDown({Key key, @required this.selectedItem}) : super(key: key);*/
}

class _Raasi_DropDownState extends State<Raasi_DropDown> {
  final Search_Controller pController = Get.put(Search_Controller());
  //final SearchDetailController pController = Get.put(SearchDetailController());
  //final Search_Member_Controller pController = Get.put(Search_Member_Controller());
  List data = [];
  bool isloading = true;

  Future<String> getKolamList() async {
    var response =
        await http.get(Uri.parse(URLs.get_raasilist), headers: {"Accept": "application/json"});
    var resBody = json.decode(response.body);
    setState(() {
      data = resBody;
      isloading = false;
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
      child: isloading
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
                        item['RasiMoonTitle'],
                        style: TextStyle(color: Colors.purple),
                      ),
                      value: item['RasiMoonId'].toString(),
                    );
                  }).toList(),
                  onChanged: (newRaasiVal) {
                    setState(() {
                      widget.selectedRasiItem = newRaasiVal.toString();
                      pController.SetsRaasiId(newRaasiVal.toString());
                    });
                  },
                  value: widget.selectedRasiItem,
                  hint: Text('Select a Raasi'),
                ),
              ],
            ),
    );
  }
}
