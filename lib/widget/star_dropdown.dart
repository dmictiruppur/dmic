import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:kannada_devangar/controller/search_controller.dart';
import 'package:kannada_devangar/controller/search_member_controller.dart';
import 'package:kannada_devangar/core/urls.dart';

class Star_DropDown extends StatefulWidget {
  String selectedStarItem;
  @override
  _Star_DropDownState createState() => _Star_DropDownState();

  /*Star_DropDown({Key key, @required this.selectedItem}) : super(key: key);*/
}

class _Star_DropDownState extends State<Star_DropDown> {
  final Search_Controller pController = Get.put(Search_Controller());
  //final SearchDetailController pController = Get.put(SearchDetailController());
  //final Search_Member_Controller pController = Get.put(Search_Member_Controller());
  List data = [];
  bool isloading = true;

  Future<String> getKolamList() async {
    var response =
        await http.get(Uri.parse(URLs.get_starlist), headers: {"Accept": "application/json"});
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
                        item['StarProTitle'],
                        style: TextStyle(color: Colors.purple),
                      ),
                      value: item['StarProId'].toString(),
                    );
                  }).toList(),
                  onChanged: (newVal) {
                    setState(() {
                      widget.selectedStarItem = newVal.toString();
                      pController.SetsNatchathiramId(newVal.toString());
                    });
                  },
                  value: widget.selectedStarItem,
                  hint: Text('Select a Natchathiram'),
                ),
              ],
            ),
    );
  }
}
