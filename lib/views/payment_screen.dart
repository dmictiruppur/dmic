import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kannada_devangar/components/appbar_title.dart';
import 'package:kannada_devangar/controller/order_controller.dart';
import 'package:kannada_devangar/controller/orderdetail_controller.dart';
import 'package:kannada_devangar/controller/payment_controller.dart';
import 'package:kannada_devangar/core/colors.dart';
import 'package:kannada_devangar/utility/app_drawer.dart';

class PaymentScreen extends GetView<Payment_Controller> {
  final Payment_Controller _payment_controller = Get.put(Payment_Controller());
  final OrderDetailController _orderDetailController =
      Get.put(OrderDetailController());

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Package Type"),
        backgroundColor: Colors.blue,
      ),
      drawer: AppDrawer(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Package2(),
              Package1(),
            ],
          ),
        ),
      ),
    );
  }

  Expanded Package2() {
    return Expanded(
        flex: 2,
        child: Obx(
          () => ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: _payment_controller.PackageList2 == null
                ? 0
                : _payment_controller.PackageList2.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  InkWell(
                    child: Card(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          _payment_controller
                                              .PackageList2[index]
                                              .packageNameTitleEn
                                              .toString(),
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.purple,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20.0,
                                        ),
                                        Text(
                                          _payment_controller
                                              .PackageList2[index]
                                              .newPackageCost
                                              .toString(),
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                //Divider(thickness: 1.0, color: Colors.purple,),
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Validity",
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.purple,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20.0,
                                        ),
                                        Text(
                                          _payment_controller
                                              .PackageList2[index].daysInName
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.purple,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                //Divider(thickness: 1.0, color: Colors.purple,),
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Profile Count",
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.purple,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20.0,
                                        ),
                                        Text(
                                          _payment_controller
                                              .PackageList2[index]
                                              .newPackageCount
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.purple,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Divider(
                                  thickness: 1.0,
                                  color: Colors.purple,
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Renewal",
                                          style: TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.purple,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                //Divider(thickness: 1.0, color: Colors.purple,),
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Validity",
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.purple,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20.0,
                                        ),
                                        Text(
                                          _payment_controller
                                              .PackageList2[index].daysInName
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.purple,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                //Divider(thickness: 1.0, color: Colors.purple,),
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Profile Count",
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.purple,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20.0,
                                        ),
                                        Text(
                                          _payment_controller
                                              .PackageList2[index]
                                              .packageRemewalCount
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.purple,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                //Divider(thickness: 1.0, color: Colors.purple,),
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Renewal Amount",
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.purple,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20.0,
                                        ),
                                        Text(
                                          _payment_controller
                                              .PackageList2[index]
                                              .packageRenewalCost
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.purple,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(15.0, 2, 15, 2),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          // Foreground color
                                          onPrimary: Colors.white,
                                          // Background color
                                          primary: Colors.deepPurple,
                                        ).copyWith(
                                            elevation:
                                                ButtonStyleButton.allOrNull(
                                                    0.0)),
                                        onPressed: () {
                                          //_payment_controller.SetsRegistrationId(_payment_controller.postsList[index].registrationId.toString());
                                          _payment_controller.AcceptPayment(
                                            _payment_controller
                                                .PackageList2[index].packageId
                                                .toString(),
                                            _orderDetailController.OrderId
                                                .toString(),
                                            _orderDetailController.OrderDetail
                                                .toString(),
                                            _payment_controller
                                                .PackageList2[index]
                                                .newPackageCost
                                                .toString(),
                                            _payment_controller
                                                .PackageList2[index]
                                                .packageRenewalCost
                                                .toString(),
                                          );
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "BUY",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Icon(
                                              Icons.shopping_cart,
                                              color: Colors.white,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ));
  }

  Expanded Package1() {
    return Expanded(
        flex: 2,
        child: Obx(
          () => ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: _payment_controller.PackageList1 == null
                ? 0
                : _payment_controller.PackageList1.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  InkWell(
                    child: Card(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          _payment_controller
                                              .PackageList1[index]
                                              .packageNameTitleEn
                                              .toString(),
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.purple,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20.0,
                                        ),
                                        Text(
                                          _payment_controller
                                              .PackageList1[index]
                                              .newPackageCost
                                              .toString(),
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                //Divider(thickness: 1.0, color: Colors.purple,),
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Validity",
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.purple,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20.0,
                                        ),
                                        Text(
                                          _payment_controller
                                              .PackageList1[index].daysInName
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.purple,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                //Divider(thickness: 1.0, color: Colors.purple,),
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Profile Count",
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.purple,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20.0,
                                        ),
                                        Text(
                                          _payment_controller
                                              .PackageList1[index]
                                              .newPackageCount
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.purple,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Divider(
                                  thickness: 1.0,
                                  color: Colors.purple,
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Renewal",
                                          style: TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.purple,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                //Divider(thickness: 1.0, color: Colors.purple,),
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Validity",
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.purple,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20.0,
                                        ),
                                        Text(
                                          _payment_controller
                                              .PackageList1[index].daysInName
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.purple,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                //Divider(thickness: 1.0, color: Colors.purple,),
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Profile Count",
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.purple,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20.0,
                                        ),
                                        Text(
                                          _payment_controller
                                              .PackageList1[index]
                                              .packageRemewalCount
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.purple,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                //Divider(thickness: 1.0, color: Colors.purple,),
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Renewal Amount",
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.purple,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20.0,
                                        ),
                                        Text(
                                          _payment_controller
                                              .PackageList1[index]
                                              .packageRenewalCost
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.purple,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(15.0, 2, 15, 2),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          // Foreground color
                                          onPrimary: Colors.white,
                                          // Background color
                                          primary: Colors.purple,
                                        ).copyWith(
                                            elevation:
                                                ButtonStyleButton.allOrNull(
                                                    0.0)),
                                        onPressed: () {
                                          //_payment_controller.SetsRegistrationId(_payment_controller.postsList[index].registrationId.toString());
                                          _payment_controller.AcceptPayment(
                                            _payment_controller
                                                .PackageList1[index].packageId
                                                .toString(),
                                            _orderDetailController.OrderId
                                                .toString(),
                                            _orderDetailController.OrderDetail
                                                .toString(),
                                            _payment_controller
                                                .PackageList1[index]
                                                .newPackageCost
                                                .toString(),
                                            _payment_controller
                                                .PackageList1[index]
                                                .packageRenewalCost
                                                .toString(),
                                          );
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "BUY",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Icon(
                                              Icons.shopping_cart,
                                              color: Colors.white,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ));
  }
}
