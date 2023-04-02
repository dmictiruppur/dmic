import 'dart:convert';

OrderDetailModel orderDetailFromJson(String str) =>
    OrderDetailModel.fromJson(json.decode(str));

String orderDetailToJson(OrderDetailModel data) => json.encode(data.toJson());

/*List<OrderDetailModel> orderDetailFromJson(String str) =>
    List<OrderDetailModel>.from(
        json.decode(str).map((x) => OrderDetailModel.fromJson(x)));

String orderDetailToJson(List<OrderDetailModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));*/

class OrderDetailModel {
  OrderDetailModel({
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

  factory OrderDetailModel.fromJson(Map<String, dynamic> json) =>
      OrderDetailModel(
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
      };
}
