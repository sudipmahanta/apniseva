// To parse this JSON data, do
//
//     final couponDataModel = couponDataModelFromJson(jsonString);

import 'dart:convert';

CouponDataModel couponDataModelFromJson(String str) => CouponDataModel.fromJson(json.decode(str));

String couponDataModelToJson(CouponDataModel data) => json.encode(data.toJson());

class CouponDataModel {
  CouponDataModel({
    this.status,
    this.error,
    this.messages,
  });

  int? status;
  bool? error;
  Messages? messages;

  factory CouponDataModel.fromJson(Map<String, dynamic> json) => CouponDataModel(
    status: json["status"] == null ? null : json["status"],
    error: json["error"] == null ? null : json["error"],
    messages: Messages.fromJson(json["messages"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "error": error,
    "messages": messages?.toJson(),
  };
}

class Messages {
  Messages({
    this.responsecode,
    this.status,
  });

  String? responsecode;
  Status? status;

  factory Messages.fromJson(Map<String, dynamic> json) => Messages(
    responsecode: json["responsecode"] == null ? null : json["responsecode"],
    status: Status.fromJson(json["status"]),
  );

  Map<String, dynamic> toJson() => {
    "responsecode": responsecode,
    "status": status == null ? null : status?.toJson(),
  };
}

class Status {
  Status({
    this.couponDetails,
    this.gst,
    this.totalAmount,
  });

  CouponDetails? couponDetails;
  Gst? gst;
  TotalAmount? totalAmount;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
    couponDetails: json["Coupon_Details"] == null ? null : CouponDetails.fromJson(json["Coupon_Details"]),
    gst: json["gst"] == null ? null : Gst.fromJson(json["gst"]),
    totalAmount: json["Total_amount"] == null ? null : TotalAmount.fromJson(json["Total_amount"]),
  );

  Map<String, dynamic> toJson() => {
    "Coupon_Details": couponDetails == null ? null : couponDetails?.toJson(),
    "gst": gst == null ? null : gst?.toJson(),
    "Total_amount": totalAmount == null ? null : totalAmount?.toJson(),
  };
}

class CouponDetails {
  CouponDetails({
    this.couponAmount,
    this.couponMsg,
  });

  String? couponAmount;
  String? couponMsg;

  factory CouponDetails.fromJson(Map<String, dynamic> json) => CouponDetails(
    couponAmount: json["coupon_amount"] == null ? null : json["coupon_amount"],
    couponMsg: json["coupon_msg"] == null ? null : json["coupon_msg"],
  );

  Map<String, dynamic> toJson() => {
    "coupon_amount": couponAmount == null ? null : couponAmount,
    "coupon_msg": couponMsg == null ? null : couponMsg,
  };
}

class Gst {
  Gst({
    this.gst,
    this.gstAmount,
  });

  String? gst;
  String? gstAmount;

  factory Gst.fromJson(Map<String, dynamic> json) => Gst(
    gst: json["gst"] == null ? null : json["gst"],
    gstAmount: json["gst_amount"] == null ? null : json["gst_amount"],
  );

  Map<String, dynamic> toJson() => {
    "gst": gst == null ? null : gst,
    "gst_amount": gstAmount == null ? null : gstAmount,
  };
}

class TotalAmount {
  TotalAmount({
    this.total,
    this.grandTotal,
  });

  String? total;
  String? grandTotal;

  factory TotalAmount.fromJson(Map<String, dynamic> json) => TotalAmount(
    total: json["Total"] == null ? null : json["Total"],
    grandTotal: json["Grand_total"] == null ? null : json["Grand_total"],
  );

  Map<String, dynamic> toJson() => {
    "Total": total == null ? null : total,
    "Grand_total": grandTotal == null ? null : grandTotal,
  };
}
