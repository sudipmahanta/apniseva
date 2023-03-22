// To parse this JSON data, do
//
//     final checkOutDataModel = checkOutDataModelFromJson(jsonString);

import 'dart:convert';

CheckOutDataModel checkOutDataModelFromJson(String str) => CheckOutDataModel.fromJson(json.decode(str));

String checkOutDataModelToJson(CheckOutDataModel data) => json.encode(data.toJson());

class CheckOutDataModel {
  CheckOutDataModel({
    this.status,
    this.error,
    this.messages,
  });

  int? status;
  bool? error;
  Messages? messages;

  factory CheckOutDataModel.fromJson(Map<String, dynamic> json) => CheckOutDataModel(
    status: json["status"] == null ? null : json["status"],
    error: json["error"] == null ? null : json["error"],
    messages: json["messages"] == null ? null : Messages.fromJson(json["messages"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "error": error == null ? null : error,
    "messages": messages == null ? null : messages!.toJson(),
  };
}

class Messages {
  Messages({
    this.responsecode,
    this.status,
  });

  String? responsecode;
  String? status;

  factory Messages.fromJson(Map<String, dynamic> json) => Messages(
    responsecode: json["responsecode"] == null ? null : json["responsecode"],
    status: json["status"] == null ? null : json["status"],
  );

  Map<String, dynamic> toJson() => {
    "responsecode": responsecode == null ? null : responsecode,
    "status": status == null ? null : status,
  };
}
