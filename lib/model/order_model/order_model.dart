// To parse this JSON data, do
//
//     final orderDataModel = orderDataModelFromJson(jsonString);

import 'dart:convert';

OrderDataModel orderDataModelFromJson(String str) => OrderDataModel.fromJson(json.decode(str));

String orderDataModelToJson(OrderDataModel data) => json.encode(data.toJson());

class OrderDataModel {
  OrderDataModel({
    this.status,
    this.error,
    this.messages,
  });

  int? status;
  bool? error;
  Messages? messages;

  factory OrderDataModel.fromJson(Map<String, dynamic> json) => OrderDataModel(
    status: json["status"] == null ? null : json["status"],
    error: json["error"] == null ? null : json["error"],
    messages: json["messages"] == null ? null : Messages.fromJson(json["messages"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "error": error == null ? null : error,
    "messages": messages == null ? null : messages?.toJson(),
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
    status: json["status"] == null ? null : Status.fromJson(json["status"]),
  );

  Map<String, dynamic> toJson() => {
    "responsecode": responsecode == null ? null : responsecode,
    "status": status == null ? null : status?.toJson(),
  };
}

class Status {
  Status({
    this.orderdtls,
  });

  List<Orderdtl>? orderdtls;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
    orderdtls: List<Orderdtl>.from(json["Orderdtls"].map((x) => Orderdtl.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Orderdtls": List<dynamic>.from(orderdtls!.map((x) => x.toJson())),
  };
}

class Orderdtl {
  Orderdtl({
    this.orderId,
    this.sheduleDate,
    this.sheduledTime,
    this.orderDateTime,
    this.status,
  });

  String? orderId;
  String? sheduleDate;
  String? sheduledTime;
  String? orderDateTime;
  String? status;

  factory Orderdtl.fromJson(Map<String, dynamic> json) => Orderdtl(
    orderId: json["Order_id"] == null ? null : json["Order_id"],
    sheduleDate: json["shedule_date"] == null ? null : json["shedule_date"],
    sheduledTime: json["sheduled_time"] == null ? null : json["sheduled_time"],
    orderDateTime: json["Order_date_time"] == null ? null : json["Order_date_time"],
    status: json["status"] == null ? null : json["status"],
  );

  Map<String, dynamic> toJson() => {
    "Order_id": orderId == null ? null : orderId,
    "shedule_date": sheduleDate == null ? null : sheduleDate,
    "sheduled_time": sheduledTime == null ? null : sheduledTime,
    "Order_date_time": orderDateTime == null ? null : orderDateTime,
    "status": status == null ? null : status,
  };
}
