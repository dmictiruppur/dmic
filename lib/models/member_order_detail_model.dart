// To parse this JSON data, do
//
//     final memberOrderDetailModel = memberOrderDetailModelFromJson(jsonString);

import 'dart:convert';

MemberOrderDetailModel memberOrderDetailModelFromJson(String str) =>
    MemberOrderDetailModel.fromJson(json.decode(str));

String memberOrderDetailModelToJson(MemberOrderDetailModel data) =>
    json.encode(data.toJson());

class MemberOrderDetailModel {
  MemberOrderDetailModel({
    this.orderId,
    this.registerationId,
    this.orderDetailId,
    this.orderDate,
    this.expireDate,
    this.orderTime,
    this.profileCount,
    this.viewedProfileCount,
    this.paidCost,
    this.isExpired,
    this.balViewCount,
    this.packageNameTitleEn,
    this.packageId,
    this.remDays,
  });

  String orderId;
  String registerationId;
  String orderDetailId;
  DateTime orderDate;
  DateTime expireDate;
  String orderTime;
  String profileCount;
  String viewedProfileCount;
  String paidCost;
  String isExpired;
  String balViewCount;
  String packageNameTitleEn;
  String packageId;
  String remDays;

  factory MemberOrderDetailModel.fromJson(Map<String, dynamic> json) =>
      MemberOrderDetailModel(
        orderId: json["OrderId"],
        registerationId: json["RegisterationId"],
        orderDetailId: json["OrderDetailId"],
        orderDate: DateTime.parse(json["OrderDate"]),
        expireDate: DateTime.parse(json["ExpireDate"]),
        orderTime: json["OrderTime"],
        profileCount: json["ProfileCount"],
        viewedProfileCount: json["ViewedProfileCount"],
        paidCost: json["PaidCost"],
        isExpired: json["IsExpired"],
        balViewCount: json["BalViewCount"],
        packageNameTitleEn: json["PackageNameTitle_en"],
        packageId: json["PackageId"],
        remDays: json["RemDays"],
      );

  Map<String, dynamic> toJson() => {
    "OrderId": orderId,
    "RegisterationId": registerationId,
    "OrderDetailId": orderDetailId,
    "OrderDate":
    "${orderDate?.year.toString().padLeft(4, '0')}-${orderDate?.month.toString().padLeft(2, '0')}-${orderDate?.day.toString().padLeft(2, '0')}",
    "ExpireDate":
    "${expireDate?.year.toString().padLeft(4, '0')}-${expireDate?.month.toString().padLeft(2, '0')}-${expireDate?.day.toString().padLeft(2, '0')}",
    "OrderTime": orderTime,
    "ProfileCount": profileCount,
    "ViewedProfileCount": viewedProfileCount,
    "PaidCost": paidCost,
    "IsExpired": isExpired,
    "BalViewCount": balViewCount,
    "PackageNameTitle_en": packageNameTitleEn,
    "PackageId": packageId,
    "RemDays": remDays,
  };
}