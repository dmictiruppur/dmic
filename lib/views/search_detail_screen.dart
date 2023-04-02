import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kannada_devangar/controller/home_controller.dart';
import 'package:kannada_devangar/controller/orderdetail_controller.dart';
import 'package:kannada_devangar/controller/search_controller.dart';
import 'package:kannada_devangar/controller/search_detail_controller.dart';
import 'package:kannada_devangar/controller/search_member_controller.dart';
import 'package:kannada_devangar/core/colors.dart';
import 'package:kannada_devangar/core/urls.dart';
import 'package:kannada_devangar/components/appbar_title.dart';
import 'package:kannada_devangar/models/search_member_model.dart';
import 'package:kannada_devangar/views/members_detail_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchDetailScreen extends GetView<Search_Member_Controller> {
  final Search_Member_Controller smController =
      Get.put(Search_Member_Controller());
  final OrderDetailController odController = Get.put(OrderDetailController());
  final HomeController hController = Get.put(HomeController());

  String AgeFrom;
  String AgeTo;
  String sMaritalStatusId;
  String sKolamId;
  String sGothiramId;
  String sThavirkumKolamId;
  String sRaasiId;
  String sNatchathiramId;
  String sRegCode;
  String IsSevaiDhosam;
  String IsSuthaJadhagam;
  String IsRaaguKedhu;

  SearchDetailScreen({
    this.AgeFrom,
    this.AgeTo,
    this.sMaritalStatusId,
    this.sKolamId,
    this.sGothiramId,
    this.sThavirkumKolamId,
    this.sRaasiId,
    this.sNatchathiramId,
    this.IsSevaiDhosam,
    this.IsSuthaJadhagam,
    this.IsRaaguKedhu,
    this.sRegCode,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Detail"),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                flex: 1,
                child: Obx(
                  () => smController.isLoading == true
                      ? Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemCount: smController.postsList == null
                              ? 0
                              : smController.postsList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(5.0, 2.0, 5.0, 2.0),
                              child: Column(
                                children: [
                                  InkWell(
                                    child: Card(
                                      elevation: 5,
                                      child: Padding(
                                        padding: const EdgeInsets.all(1.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(2.0),
                                              child: GestureDetector(
                                                onTap: () {},
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      "${smController.postsList[index].regCode}",
                                                      style: TextStyle(
                                                        fontSize: 12.0,
                                                        color: Colors.purple,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5.0,
                                                    ),
                                                    Container(
                                                      width: 120.0,
                                                      height: 120.0,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          /*image: DecorationImage(
                                                              image: int.parse(smController.postsList[index].mProfileViewId.toString()) > 0
                                                                  ? smController.postsList[index].profilePhotoImage.toString() != "null"
                                                                      ? NetworkImage(URLs.ImgUrl + "/" + smController.postsList[index].registrationId.toString() + "/" + smController.postsList[index].profilePhotoImage.toString())
                                                                      : AssetImage('assets/images/no-image.jpg')
                                                                  : AssetImage('assets/images/no-image.jpg'),
                                                              fit: BoxFit.cover),*/
                                                          image:
                                                              DecorationImage(
                                                                  image: smController
                                                                              .postsList[index]
                                                                              .profilePhotoImage
                                                                              .toString() !=
                                                                          "null"
                                                                      ? NetworkImage(URLs.ImgUrl + "/" + smController.postsList[index].registrationId.toString() + "/" + smController.postsList[index].profilePhotoImage.toString())
                                                                      : AssetImage('assets/images/no-image.jpg'),
                                                                  fit: BoxFit.cover),
                                                          borderRadius: BorderRadius.all(Radius.circular(2.0)),
                                                          boxShadow: [
                                                            BoxShadow(
                                                                blurRadius: 1.0,
                                                                color: Colors
                                                                    .black)
                                                          ]),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {},
                                              child: Container(
                                                padding: EdgeInsets.fromLTRB(
                                                    10.0, 2, 15, 2),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      smController
                                                          .postsList[index]
                                                          .memberNameEn
                                                          .toString(),
                                                      style: TextStyle(
                                                        fontSize: 15.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.purple,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5.0,
                                                    ),
                                                    Text(
                                                      "Age ${smController.postsList[index].age}, ${smController.postsList[index].kolamTitleEn}",
                                                      style: TextStyle(
                                                        fontSize: 12.0,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5.0,
                                                    ),
                                                    Text(
                                                      "${smController.postsList[index].gothramTitleEn}",
                                                      style: TextStyle(
                                                        fontSize: 12.0,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5.0,
                                                    ),
                                                    Text(
                                                      "${smController.postsList[index].rasiMoonTitleEn}",
                                                      style: TextStyle(
                                                        fontSize: 12.0,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5.0,
                                                    ),
                                                    Text(
                                                      "${smController.postsList[index].starProTitleEn}",
                                                      style: TextStyle(
                                                        fontSize: 12.0,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5.0,
                                                    ),
                                                    Text(
                                                      "${smController.postsList[index].cityNameEn}",
                                                      style: TextStyle(
                                                        fontSize: 12.0,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        ElevatedButton(
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            // Foreground color
                                                            onPrimary:
                                                                Colors.white,
                                                            // Background color
                                                            primary: Colors
                                                                .deepPurple,
                                                          ).copyWith(
                                                              elevation:
                                                                  ButtonStyleButton
                                                                      .allOrNull(
                                                                          0.0)),
                                                          onPressed: () {
                                                            smController.SetsRegistrationId(
                                                                smController
                                                                    .postsList[
                                                                        index]
                                                                    .registrationId
                                                                    .toString());
                                                            smController.SetOrderId(
                                                                odController
                                                                        .OrderId
                                                                    .toString());
                                                            smController.SetOrderDetailId(
                                                                odController
                                                                        .OrderDetail
                                                                    .toString());
                                                            Get.to(
                                                              /*MemberDetailScreen(
                                                            sRegistrationId:"${smController.postsList[index].registrationId}",
                                                            mRegistrationId: smController.RegistrationId.toString(),
                                                            mOrderId: odController.OrderId.toString(),
                                                            mOrderDetailId: odController.OrderDetail.toString(),
                                                          ),*/

                                                              smController
                                                                  .fetch_single_member_detail(
                                                                smController
                                                                        .RegistrationId
                                                                    .toString(),
                                                                "${smController.postsList[index].registrationId}",
                                                                odController
                                                                        .OrderId
                                                                    .toString(),
                                                                odController
                                                                        .OrderDetail
                                                                    .toString(),
                                                              ),
                                                            );
                                                          },
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                "View Profile",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                              SizedBox(
                                                                width: 20,
                                                              ),
                                                              Icon(
                                                                int.parse(smController
                                                                            .postsList[
                                                                                index]
                                                                            .mProfileViewId) >
                                                                        0
                                                                    ? Icons
                                                                        .remove_red_eye
                                                                    : Icons
                                                                        .lock_rounded,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 10.0,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                )),
          ],
        ),
      ),
    );
  }
}

/*class SearchDetailScreen extends StatefulWidget
{
  @override
  _SearchDetailScreenState createState() => _SearchDetailScreenState();
}

class _SearchDetailScreenState extends State<SearchDetailScreen> {
  Search_Controller sController = Get.put(Search_Controller());
  final OrderDetailController odController = Get.put(OrderDetailController());
  SharedPreferences sharedPreferences;

  List<SearchMemberListModel> _list = [];
  bool isloading = true;
  Future data;
  var data1 = [];
  String sOrderDetail = '';
  String sOrderId = '';
  bool IsAllowUnlock = true;
  String RegistrationId = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.checkLoginStatus();
    //this.fetchUnlockedProfileList();
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      //RegistrationId = sharedPreferences.getString("RegistrationId");
      //searchDetailController.SetsRegistrationId(RegistrationId);
      sOrderDetail = odController.OrderDetail.value.toString();
      sOrderId = odController.OrderId.value.toString();
    });
  }

  */
/*Future<String> fetchUnlockedProfileList() async {
    Dio dio = new Dio();
    //isLoading(true);
    final body = {
      'MemberId': sController.RegistrationId.toString(),
      'AgeFrom': sController.AgeFrom.toString(),
      'AgeTo': sController.AgeTo.toString(),
      'maritualstatus': sController.sMaritalStatusId.toString(),
      'kolam': sController.sKolamId.toString(),
      'gothram': sController.sGothiramId.toString(),
      'raasimoon': sController.sRaasiId.toString(),
      'starpro': sController.sNatchathiramId.toString(),
      'sevadhosam': sController.IsSevaiDhosam.toString(),
      'raadukedhu': sController.IsRaaguKedhu.toString(),
      'suthajaadhagam': sController.IsSuthaJadhagam.toString(),
      'RegCode': sController.RegCode.toString()
    };
    final response = await dio.post(URLs.search_members,
        data: body, options: Options(headers: _setHeaders()));
    if (response.statusCode == 200) {
      data1 = response.data;
      setState(() {
        isloading = false;
      });
    } else {
      Get.snackbar("Error - Fetch Search Members - ", response.data);
    }
    return "Success";
  }*/
/*
  @override
  Widget build(BuildContext context) {
    SearchDetailController searchDetailController = Get.put(SearchDetailController(search_controller: sController));
    //print(searchDetailController.isLoading);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: new AppBarTitle("Search Detail"),
        backgroundColor: TassistMenuBg,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Center(
                child: Column(
                        children: [
                          Obx(
                              () => ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                physics: const AlwaysScrollableScrollPhysics(),
                                itemCount: searchDetailController.SearchMembersList == null ? 0 : searchDetailController.SearchMembersList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Expanded(
                                    child: Column(
                                      children: [
                                        InkWell(
                                          child: Card(
                                            child: Padding(
                                              padding: const EdgeInsets.all(1.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.all(2.0),
                                                    child: GestureDetector(
                                                      onTap: () {},
                                                      child: Container(
                                                        width: 120.0,
                                                        height: 120.0,
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            image: DecorationImage(
                                                                image: searchDetailController.SearchMembersList[index].profilePhotoImage !=
                                                                    null
                                                                    ?
                                                                int.parse(searchDetailController.SearchMembersList[index].mProfileViewId) > 0 ?
                                                                NetworkImage(URLs.ImgUrl + "/" + searchDetailController.SearchMembersList[index].registrationId + "/" + searchDetailController.SearchMembersList[index].profilePhotoImage)
                                                                : AssetImage('assets/images/no-image.jpg')
                                                                    : AssetImage('assets/images/no-image.jpg'),
                                                                fit: BoxFit.cover),
                                                            borderRadius: BorderRadius.all(Radius.circular(2.0)),
                                                            boxShadow: [
                                                              BoxShadow(
                                                                  blurRadius: 1.0,
                                                                  color:
                                                                  Colors.black)
                                                            ]),
                                                      ),
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      */
/*return showDialog<void>(
                                                    context: context,
                                                    barrierDismissible: false,
                                                    builder:
                                                        (BuildContext conext) {
                                                      return AlertDialog(
                                                        title: Text(
                                                            'Not in stock'),
                                                        content: const Text(
                                                            'This item is no longer available'),
                                                        actions: <Widget>[
                                                          FlatButton(
                                                            child: Text('Ok'),
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );*/
/*
                                                    },
                                                    child: Container(
                                                      padding: EdgeInsets.fromLTRB(
                                                          30.0, 2, 15, 2),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                        children: [
                                                          Text(
                                                            searchDetailController.SearchMembersList[index].memberNameEn,
                                                            style: TextStyle(
                                                              fontSize: 20.0,
                                                              fontWeight:
                                                              FontWeight.bold,
                                                              color: Colors.black,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 5.0,
                                                          ),
                                                          Text(
                                                            "Age ${searchDetailController.SearchMembersList[index].age}, ${searchDetailController.SearchMembersList[index].kolamTitleEn}",
                                                            style: TextStyle(
                                                              fontSize: 10.0,
                                                              color: Colors.black38,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 5.0,
                                                          ),
                                                          Text(
                                                            "${searchDetailController.SearchMembersList[index].gothramTitleEn}",
                                                            style: TextStyle(
                                                              fontSize: 10.0,
                                                              color: Colors.black38,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 5.0,
                                                          ),
                                                          Text(
                                                            "${searchDetailController.SearchMembersList[index].rasiMoonTitleEn}, ${searchDetailController.SearchMembersList[index].starProTitleEn}",
                                                            style: TextStyle(
                                                              fontSize: 12.0,
                                                              color: Colors.black,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 5.0,
                                                          ),
                                                          Text(
                                                            "${searchDetailController.SearchMembersList[index].cityNameEn}",
                                                            style: TextStyle(
                                                              fontSize: 12.0,
                                                              color: Colors.black,
                                                            ),
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                            children: [
                                                              RaisedButton(
                                                                onPressed: () {
                                                                  searchDetailController.SetsRegistrationId(searchDetailController.SearchMembersList[index].registrationId);
                                                                  searchDetailController.SetmProfileViewId(searchDetailController.SearchMembersList[index].mProfileViewId);
                                                                  Get.to(
                                                                    MemberDetailScreen(
                                                                      mRegistrationId:
                                                                      RegistrationId,
                                                                      sRegistrationId:
                                                                      searchDetailController.SearchMembersList[index].registrationId,
                                                                      mOrderId:
                                                                      sOrderId,
                                                                      mOrderDetail:
                                                                      sOrderDetail,
                                                                      mProfileViewId:
                                                                      searchDetailController.SearchMembersList[index].mProfileViewId,
                                                                    ),
                                                                  );
                                                                },
                                                                child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                  children: [
                                                                    Text("View Detail", style: TextStyle(color: Colors.white),),
                                                                    SizedBox(width: 20,),
                                                                    Icon(
                                                                      int.parse(searchDetailController.SearchMembersList[index].registrationId) > 0
                                                                          ? Icons
                                                                          .remove_red_eye
                                                                          : Icons
                                                                          .lock_rounded,
                                                                      color:
                                                                      Colors.white,
                                                                    ),
                                                                  ],
                                                                ),
                                                                color: Colors
                                                                    .deepPurple,
                                                              ),
                                                              SizedBox(
                                                                width: 10.0,
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              )
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}*/

_setHeaders() => {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Access-Control_Allow_Origin': '*'
    };
