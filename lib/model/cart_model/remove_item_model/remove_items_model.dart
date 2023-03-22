// To parse this JSON data, do
//
//     final removeItemDataModel = removeItemDataModelFromJson(jsonString);

import 'dart:convert';

RemoveItemDataModel removeItemDataModelFromJson(String str) => RemoveItemDataModel.fromJson(json.decode(str));

String removeItemDataModelToJson(RemoveItemDataModel data) => json.encode(data.toJson());

class RemoveItemDataModel {
  RemoveItemDataModel({
    this.status,
    this.error,
    this.messages,
  });

  int? status;
  bool? error;
  Messages? messages;

  factory RemoveItemDataModel.fromJson(Map<String, dynamic> json) => RemoveItemDataModel(
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
