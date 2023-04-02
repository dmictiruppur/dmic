// To parse this JSON data, do
//
//     final packageModel = packageModelFromJson(jsonString);

import 'dart:convert';

PackageModel packageModelFromJson(String str) => PackageModel.fromJson(json.decode(str));

String packageModelToJson(PackageModel data) => json.encode(data.toJson());

class PackageModel {
  PackageModel({
    this.orderId,
    this.orderDetailId,
    this.isExpired,
    this.packageId,
    this.newPackageCost,
    this.newPackageCount,
    this.className,
    this.packageNameTitleEn,
    this.packageDescEn,
    this.daysInName,
    this.profileCount,
    this.packageRenewalCost,
    this.packageRemewalCount,
  });

  String orderId;
  String orderDetailId;
  String isExpired;
  String packageId;
  String newPackageCost;
  String newPackageCount;
  String className;
  String packageNameTitleEn;
  String packageDescEn;
  String daysInName;
  String profileCount;
  String packageRenewalCost;
  String packageRemewalCount;

  factory PackageModel.fromJson(Map<String, dynamic> json) => PackageModel(
    orderId: json["OrderId"],
    orderDetailId: json["OrderDetailId"],
    isExpired: json["IsExpired"],
    packageId: json["PackageId"],
    newPackageCost: json["NewPackageCost"],
    newPackageCount: json["NewPackageCount"],
    className: json["ClassName"],
    packageNameTitleEn: json["PackageNameTitle_en"],
    packageDescEn: json["PackageDesc_en"],
    daysInName: json["DaysInName"],
    profileCount: json["ProfileCount"],
    packageRenewalCost: json["PackageRenewalCost"],
    packageRemewalCount: json["PackageRemewalCount"],
  );

  Map<String, dynamic> toJson() => {
    "OrderId": orderId,
    "OrderDetailId": orderDetailId,
    "IsExpired": isExpired,
    "PackageId": packageId,
    "NewPackageCost": newPackageCost,
    "NewPackageCount": newPackageCount,
    "ClassName": className,
    "PackageNameTitle_en": packageNameTitleEn,
    "PackageDesc_en": packageDescEn,
    "DaysInName": daysInName,
    "ProfileCount": profileCount,
    "PackageRenewalCost": packageRenewalCost,
    "PackageRemewalCount": packageRemewalCount,
  };
}
